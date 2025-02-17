import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:live_activities/models/live_activity_state.dart';
import 'package:trend/core/presentation/arguments/order_tracking_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/data/models/orders/order_live_activity_model.dart';
import 'package:trend/third_parties_modules/abstract/i_live_activities_shower_module.dart';
import 'package:live_activities/live_activities.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';

@Singleton(as:ILiveActivitiesShowerModule)
class LiveActivitiesShowerModule extends ILiveActivitiesShowerModule{
  final ILoggerModule logger;
  final LiveActivities _liveActivitiesPlugin = LiveActivities();
  final AppRouter appRouter;
  String? activityId;

  LiveActivitiesShowerModule(this.logger,this.appRouter){
    init();
  }

  Future<void> init()async{
    if(Platform.isAndroid){
      return;
    }

    await _liveActivitiesPlugin.init(appGroupId: 'group.active_order_widget',urlScheme: 'wowvirliveactivity' );

    _liveActivitiesPlugin.urlSchemeStream().listen((final schemaData){

      final Map<String,String> queryParameters=schemaData.queryParameters.fold({}, (final previous,final current)=>
          previous..addEntries([MapEntry(current['name']!, current['value']!)]));

      if(queryParameters['id']==null) {
        return;
      }
      if(queryParameters['tracking']=='true') {
        appRouter.push(OrderTrackingRoute(args: OrderTrackingPageArguments(orderId: queryParameters['id']!, orderNumber: queryParameters['number']!)));
      } else {
        appRouter.push(OrderDetailsRoute(orderId: queryParameters['id']!));
      }
    });

    _liveActivitiesPlugin.activityUpdateStream.listen((final event){
      activityId=event.activityId;
    });
  }
  @override
  Future<void> showOrder({required final OrderLiveActivityModel orderLiveActivity})async{
    try {
      final bool isEnabled = await _liveActivitiesPlugin.areActivitiesEnabled();
      if(!isEnabled) {
        return ;
      }
      if(activityId==null|| (await _liveActivitiesPlugin.getActivityState(activityId!))!=LiveActivityState.active) {
        await cancelNotifications();
        activityId=await _liveActivitiesPlugin.createActivity(orderLiveActivity.toJson());
      } else {
        await _liveActivitiesPlugin.updateActivity(activityId!,orderLiveActivity.toJson());
      }
    }  catch (e,stackTrace) {
      logger.logCritical(exception: e,stackTrace: stackTrace);
    }

  }

  @override
  Future<void> cancelNotifications() async {
    await  _liveActivitiesPlugin.endAllActivities();
    activityId=null;
  }

}