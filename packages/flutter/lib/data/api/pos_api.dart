import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/daily_report_model.dart';
import '../models/payment_result_model.dart';
import '../models/pos_menu_item_model.dart';
import '../models/pos_order_model.dart';
import '../models/pos_table_model.dart';
import '../models/top_item_model.dart';

part 'pos_api.g.dart';

@RestApi()
abstract class PosApi {
  factory PosApi(Dio dio, {String baseUrl}) = _PosApi;

  @GET('/tables')
  Future<List<PosTableModel>> getTables();

  @GET('/menu')
  Future<List<PosMenuItemModel>> getMenu();

  @POST('/orders')
  Future<PosOrderModel> createOrder(@Body() Map<String, dynamic> body);

  @GET('/kitchen/queue')
  Future<List<PosOrderModel>> getKitchenQueue();

  @PATCH('/kitchen/{id}/done')
  Future<PosOrderModel> markKitchenDone(@Path('id') int orderId);

  @GET('/orders/active')
  Future<List<PosOrderModel>> getActiveOrders();

  @POST('/payments')
  Future<PaymentResultModel> createPayment(@Body() Map<String, dynamic> body);

  @PATCH('/payments/{id}/void')
  Future<void> voidPayment(@Path('id') int paymentId);

  @GET('/reports/daily')
  Future<DailyReportModel> getDailyReport(@Query('date') String date);

  @GET('/reports/items')
  Future<List<TopItemModel>> getTopItems(
    @Query('date') String date,
    @Query('limit') int limit,
  );
}
