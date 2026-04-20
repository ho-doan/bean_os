import { Injectable } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';

export type DailyReportRow = {
  date: string;
  totalRevenue: number;
  orderCount: number;
};

export type TopItemRow = {
  menuItemId: number;
  name: string;
  qtySold: number;
};

@Injectable()
export class ReportsService {
  constructor(@InjectDataSource() private readonly dataSource: DataSource) {}

  async getDaily(date: string): Promise<DailyReportRow> {
    const rows = await this.dataSource.query<
      { total: string | null; orderCount: string | null }[]
    >(
      `
      SELECT
        COALESCE(SUM(p.amount), 0) AS total,
        COUNT(DISTINCT p.order_id) AS orderCount
      FROM payments p
      WHERE p.voided_at IS NULL
        AND DATE(p.created_at) = DATE(?)
    `,
      [date],
    );
    const row = rows[0] ?? { total: '0', orderCount: '0' };
    return {
      date,
      totalRevenue: Number(row.total ?? 0),
      orderCount: Number(row.orderCount ?? 0),
    };
  }

  async getTopItems(date: string, limit = 20): Promise<TopItemRow[]> {
    const rows = await this.dataSource.query<
      { menuItemId: number; name: string; qtySold: string }[]
    >(
      `
      SELECT
        mi.id AS menuItemId,
        mi.name AS name,
        SUM(oi.qty) AS qtySold
      FROM order_items oi
      INNER JOIN orders o ON o.id = oi.order_id
      INNER JOIN payments p ON p.order_id = o.id AND p.voided_at IS NULL
      INNER JOIN menu_items mi ON mi.id = oi.menu_item_id
      WHERE DATE(p.created_at) = DATE(?)
      GROUP BY mi.id, mi.name
      ORDER BY qtySold DESC
      LIMIT ?
    `,
      [date, limit],
    );
    return rows.map((r) => ({
      menuItemId: Number(r.menuItemId),
      name: r.name,
      qtySold: Number(r.qtySold),
    }));
  }
}
