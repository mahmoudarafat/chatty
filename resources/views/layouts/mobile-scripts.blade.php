<script src="{{url('assets/js/jquery-3.3.1.min.js')}}"></script>
<script src="{{url('assets/js/bootstrap.min.js')}}"></script>
<script src="{{url('assets/js/metisMenu/jquery.metisMenu.js')}}"></script>
<script src="{{url('assets/js/slimscroll/jquery.slimscroll.min.js')}}"></script>
<script src="{{url('assets/js/plugins.js')}}"></script>
<script src="{{url('assets/js/inspinia.js')}}"></script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
{{--<script>--}}
{{--    $('.input-daterange').datepicker({--}}
{{--        keyboardNavigation: false,--}}
{{--        forceParse: false,--}}
{{--        autoclose: true--}}
{{--    });--}}
{{--</script>--}}
@include('layouts.scripts.delete')
@stack('print')
@stack('scripts')
<script src="{{mix('js/app.js')}}" async defer></script>
<script>
    $(document).on("keydown", "form", function (event) {
        return event.key != "Enter";
    });
</script>
