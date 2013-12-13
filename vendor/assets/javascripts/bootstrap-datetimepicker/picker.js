$(document).on('ready page:change', function() {    

    $('.date-picker').datetimepicker({
        pickTime: false
    });

    $('.datetime-picker').datetimepicker({
        pickSeconds: false
    });

    $('.time-picker').datetimepicker({
        pickDate: false,
        pickSeconds: false
    });
})
