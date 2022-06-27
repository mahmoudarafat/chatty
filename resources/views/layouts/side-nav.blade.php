<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header  text-center">
                <div class=" profile-element"> <span>
                    <a href="https://www.albadrsales.com/ar/">
                    <img alt="image" class="img-circle" src="{{url('assets/img/logo.jpg')}}">
                    </a>                              </span>
                    <span class="clear">
                    <span class="block m-t-xs"> <strong class="font-bold">{{auth()->user()->name}}</strong>
                    </span>
                    </span>
                </div>
            </li>
            <li class=""><a href="{{route(config('chatify.routes.prefix'))}}" data-toggle="tooltip" data-placement="left" title=" الرسايل ">
                    <i class="fa fa-comments fa-3x"></i>
                </a>
            </li>
            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="العملاء">
                    <i class="fa fa-vcard fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="{{route('clients.index')}}">عرض العملاء </a></li>
                    <li><a href="{{route('app.clients')}}">مستخدمي تطبيق سوق البدر </a></li>
                    <li><a href="evaluation-report.html">تقييمات العملاء </a></li>


                </ul>
            </li>
            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="احصائيات">
                    <i class="fa fa-bar-chart fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="conversation-report.html">المحادثات اليوميه </a></li>
                    <li><a href="dailyeval-report.html"> 1تقييم العملاء</a></li>
                    <li><a href="compare-dailyeval-report.html"> 2تقييم العملاء</a></li>

                </ul>
            </li>
            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="عرض مقدمى الخدمة">
                    <i class="fa fa-users	 fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="user-report.html"> مقدمى الخدمة </a></li>


                </ul>
            </li>

            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="الاعدادت ">
                    <i class="fa fa-cogs	 fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="{{route('countries.create')}}"> اضافة دولة </a></li>
                    <li><a href="{{route('countries.index')}}"> عرض كل الدول </a></li>
                    <li><a href="{{route('cities.create')}}"> اضافة مدينة </a></li>
                    <li><a href="{{route('cities.index')}}"> عرض كل المدن </a></li>
                    <li><a href="{{route('activites.index')}}"> عرض الانشطه </a></li>
                    <li><a href="{{route('setting.index')}}"> اعدادات سوق البدر </a></li>
                    <li><a href="{{url('static-page')}}"> الصفحات الثابته </a></li>
                    <li><a href="{{ route('intro.index') }}">المقدمة</a></li>
                    <li><a href="{{ route('app-settings.index') }}">إعدادت التطبيق</a></li>
                    <li><a href="{{ route('notification.index') }}">إرسال الإشعارات</a></li>
                </ul>
            </li>

            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="الاشتراكات">
                    <i class="fa fa-database fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="{{route('participations.index')}}"> عرض الاشتراكات </a></li>
                </ul>
            </li>

            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="تحديث البرنامج">
                    <i class="fa fa-magic fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="{{route('updates.create')}}"> اضافة تحديث </a></li>
                    <li><a href="{{route('updates.index')}}"> عرض التحديثات </a></li>
                    <li><a href="{{route('updates.clients')}}"> تحديثات العملاء </a></li>
                </ul>
            </li>


            <li class="">
                <a href="#" data-toggle="tooltip" data-placement="left" title="تحديث البرنامج">
                    <i class="fa fa-building-o fa-2x" aria-hidden="true"></i>
                    <span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="{{route('companies.index')}}">عرض شركات المهام </a></li>
                </ul>
            </li>


            <li class=""><a href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"
                            data-toggle="tooltip" data-placement="left" title="تسجيل الخروج "> <i
                        class="fa fa-sign-out fa-2x"></i>
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                      style="display: none;">
                    @csrf
                </form>

            </li>
        </ul>
    </div>
</nav>
<div id="page-wrapper" class="gray-bg">
    <div class="row border-bottom">
        <nav
            class="navbar navbar-static-top white-bg"
            role="navigation"
            style="margin-bottom: 0"
        >
            <div class="navbar-header">
                <a
                    class="navbar-minimalize minimalize-styl-2 btn btn-primary"
                    href="#"
                ><i class="fa fa-bars"></i>
                </a>
            </div>
        </nav>
    </div>

