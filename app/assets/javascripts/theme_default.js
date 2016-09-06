//= require unobtrusive_flash
//= require theme_default/toastr.min

//= require theme_default/tether.min
//= require theme_default/bootstrap.min
//= require theme_default/waves
//= require theme_default/jquery.nicescroll
//= require theme_default/switchery/switchery.min

//= require theme_default/morris/morris.min
//= require theme_default/raphael/raphael-min

//= require theme_default/waypoints/lib/jquery.waypoints
//= require theme_default/counterup/jquery.counterup.min

//= require theme_default/jquery.core
//= require theme_default/jquery.app
//= require theme_default/jquery.dashboard

//= require_self

//unobtrusive_flash
flashHandler = function(e, params) {
    var msgType = params.type;
    if (params.type == 'notice') { msgType = 'info' }
    if (params.type == 'notice_force_close') { toastr.options.timeOut = 0; msgType = 'info'; }
    if (params.type == 'alert') { msgType = 'warning' }
    if (params.message!=undefined && params.message!='') {
        toastr[msgType](params.message);
    }
};
$(window).bind('rails:flash', flashHandler);
