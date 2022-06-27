-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 06, 2022 at 02:45 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasks-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `absent_permissions`
--

CREATE TABLE `absent_permissions` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `absent_date` date NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attend_device`
--

CREATE TABLE `attend_device` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(16) NOT NULL,
  `port` int(11) NOT NULL,
  `iMachineNumber` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `backlogs`
--

CREATE TABLE `backlogs` (
  `id` int(11) NOT NULL,
  `title` varchar(220) NOT NULL,
  `description` text,
  `project_id` int(11) NOT NULL,
  `point_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `backlogs`
--

INSERT INTO `backlogs` (`id`, `title`, `description`, `project_id`, `point_id`, `priority_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'بيع الصنف باكثر من وحده في تطبيق المندوبين', '<p> كمستخدم عند اضافه الصنف  بوحده فرعيه  اريدعند انشاء فاتوره بيع او مرتجع الاختيار بين الوحدات في تطبيق المندوبين </p>', 1, 60, 4, 747, '2022-04-03 16:52:45', '2022-04-03 17:35:47'),
(2, 'اظهار صوره الاصناف في تطبيق المندوبين', '<p>كمستخدم عند اضافه صوره للصنف عند استخدام التطبيق ظهور الصنف بالصوره عند انشاء فاتوره بيع او مرتجع</p>', 1, 30, 3, 747, '2022-04-03 17:05:13', '2022-04-03 17:39:14'),
(3, 'مزامنه اضافات ثابته علي الفواتير', '<p>كمستخدم عند تغيير الاعدادات الخاصه علي الفواتير بنعم ام لا اريد عند  مزامنه  التطبيق تكون الاسعار حسب الاعدادات</p>', 1, 60, 4, 747, '2022-04-03 17:44:29', '2022-04-03 17:44:29'),
(4, 'مزامنه اخر سعر بيع للعميل', '<p>كمستخدم عند تغيير اعدادات اظهار اخر سعر للعميل  اريد عند البيع من التطبيق مزامنه اخر سعر بيع للعميل</p>', 1, 30, 3, 747, '2022-04-03 17:48:02', '2022-04-03 17:48:02'),
(5, 'مزامنه البيع بالسالب', '<p>كمستخدم عند تفعيل البيع بالسالب من الاعدادات اريد  عند البيع من التطبيق ايضا البيع بالسالب</p>', 1, 30, 4, 747, '2022-04-03 17:49:37', '2022-04-03 17:49:37'),
(6, 'اعدادات لفاتورة مشتريات الخردة', '<p>اضافه ظهور واخفاء فاتورة المشتريات بالجدول لاصناف الخردة </p>', 1, 10, 3, 696, '2022-04-03 21:41:01', '2022-04-03 21:41:01'),
(7, 'اعدادات الطباعه للمطبخ', '<p>وضع اعدادات للطابعه الاضافيه الخاصه بالمطبخ</p><p>هل تطبع الاقسام منفصله على حسب الطابعه ام كلهم فى طابعه واحده </p><p>ووتفعيلالامر تلقائى دون لتعديل ملف الهيدر كل مره </p><p>وايضا ظهور طريقه الدفع او اخفائها </p><p>مثال مشهور يطلب كثير سفرى ومحلى وصالةفى الطباعه للمطبخ </p><p><br></p>', 1, 20, 3, 696, '2022-04-06 04:05:33', '2022-04-06 04:05:33'),
(8, 'تصميم صفحات تعريف بتطبيق المندوبين', '<p>عمل صفحه خاصه بواجه التطبيق للتعريف عنه وكيفيه التسجيل عليه وطلب الاشتراك</p><p>ويفضل صفحه الاشتراك تحول لصفحه خاصه بتطبيق المندوبين</p>', 1, 20, 2, 696, '2022-04-06 04:08:42', '2022-04-06 04:08:42'),
(9, 'تسجيل حساب شركة', '<p>عمل صفحه لتسجيل حساب شركة جديده </p><p>وكل شركه تعرض فقط المشاريع والموظفين الخاصه بيها </p><p>والموظف بعد تسجيل الدخول يقوم بالدخول على حساب شركته فقط</p>', 16, 30, 4, 696, '2022-04-06 04:10:55', '2022-04-06 04:10:55'),
(10, 'نظام تقييم للمهام', '<p>عمل حساب اضافه او خصم نقاط مع تغير حالة التاسك </p><p>مثال </p><p>عند تنفيذ تاسك فى الوقت المحدد نقطه </p><p>واذا تم اعاده فتح التاسك مره اخرى يتم خصم نقطه </p><p>لعمل تقييم لعدد النقاط التى يحصل عليها من خلال تنفيذ التاسكات </p>', 16, 30, 2, 696, '2022-04-06 04:13:32', '2022-04-06 04:13:32'),
(11, 'الأشعارت', '<p>تفعيل الاشعارات فى المصتفح للموظف للتنبيه</p>', 16, 20, 4, 696, '2022-04-06 04:14:01', '2022-04-06 04:14:01'),
(12, 'تطبيق متابعه المهام', '<p>عمل تطبيق لمتابعه المهام وتنفيذها ويصل اشعارات من خلال التطبيق للموظف </p>', 16, 100, 3, 696, '2022-04-06 04:14:38', '2022-04-06 04:14:38'),
(13, 'صفحه تفاصيل المشروع', '<p>تعديل صفحه تفاصيل المشروع </p><p>ووضع ايقونات للباك لوج ويفضل تصميم وترتيب مناسب للحقول الخاصه بالمشروع </p>', 16, 20, 3, 696, '2022-04-06 04:19:10', '2022-04-06 04:19:10'),
(15, 'تسجيل الاصول وارصدة اول المده', '<p>تسجيل ارصدة اول المده والاصول الخاص بالمؤسسة </p>', 1, 3, 4, 707, '2022-04-10 18:45:46', '2022-04-11 14:43:06'),
(16, 'تقرير موازنه المؤسسة', '<p>تقرير لعرض الموزانه بتاريخ محدد</p>', 1, 3, 2, 707, '2022-04-11 13:35:12', '2022-04-11 14:42:20'),
(17, 'تقرير ميزان المراجعة', '<p>test</p>', 1, 4, 2, 696, '2022-04-11 14:30:01', '2022-04-11 14:30:01'),
(18, 'الفاتورة الالكترونية', '<p>ربط الفاتورة الإلكترونية </p>', 1, 5, 2, 696, '2022-04-11 17:56:34', '2022-04-11 17:56:34'),
(19, 'مراجعة الاشتراكات والباقات', '<p>نظام الاشتراك وتكلفه الاشتراك والتجديد للمستخدمين والمخازن </p>', 1, 3, 3, 696, '2022-04-12 15:28:59', '2022-04-12 15:28:59'),
(20, 'اعدادت التحكم فى تصميم الفاتورة', '<p>مراجعه نموذج الفاتورة الخاصه بالاعدادات لتمكن العميل من عمل التصميم المناسب له </p>', 1, 3, 3, 696, '2022-04-12 16:59:36', '2022-04-12 16:59:36'),
(22, 'نص القسم على العمولة لمقدم الخدمة', '<p>* ظهور نص القسم الخاص بالعمولة بالتطبيق بالنسبة لمقدم الخدمة بعد انشاء الحساب وبعد الموافقه على الشروط والاحكام للموافقه عليها</p>', 57, 3, 2, 739, '2022-04-14 15:16:05', '2022-04-18 15:53:58'),
(23, 'نص فترة التسجيل', '<ul><li>ظهور بملف العميل ومقدم الخدمة نص تنبيهي بفترة اشتراكه او تسجيلة بالتطبيق على ان تظهر للعميل  والمقدم وبحساب الملف الشخصي لكل منهم </li></ul>', 57, 5, 4, 730, '2022-04-14 15:44:40', '2022-04-17 16:46:29'),
(24, 'الظهور بناءا على المدينة', '<p>ظهور مقدمى الخدمة لدى العملاء يعتمد على البلدان المُسجل بها كل من الاخر .. بمعنى عميل جدة يظهرله مقدمين جدة فقط </p><p>\" اختيار المدينه \"</p>', 57, 3, 4, 730, '2022-04-17 16:48:07', '2022-04-17 16:48:07'),
(25, 'حذف ازار طلب الخدمة', '<ul><li>حذف ازرار طلب الخدمة الموجودة بحسابات المقدمين والاكتفاء فقط بعرض للخدمات الثابته واضافة رز المحادثة داخل ملف المقدم </li></ul>', 57, 3, 4, 730, '2022-04-17 17:24:57', '2022-04-17 17:24:57'),
(26, 'ملغى( موجود بمكان اخر ) القيمة المضافه', '<ul><li>حذف خاصية القيمة المضافه </li></ul>', 57, 2, 4, 730, '2022-04-17 17:25:55', '2022-04-19 16:04:15'),
(27, 'انشاء حساب مقدم خدمة', '<p>عند انشاء حساب مقدم خدمة بالتطبيق يتم تغيير خانات \" صورة الهوية ورقم الهوية \" للشركات والمؤسسات فقط الى صورة \" السجل التجارى ورقم السجل التجارى \" في حساب الشركات والمؤسسات  .</p>', 57, 3, 4, 730, '2022-04-18 16:13:39', '2022-04-18 16:13:39'),
(28, 'الغاء طلب خدمة', '<p>حذف زر طلب خدمة الموجود بالصفحة الرئيسية وبناءا عليه يتم حذف كل ما يتعلق باالطلبات سواء صفحة الطلبات بالتطبيق او بلوحة التحكم لعدم وجود امكانيه طلب خدمة من مقدم </p>', 57, 3, 4, 730, '2022-04-18 16:14:46', '2022-04-18 16:14:46'),
(29, 'اضافات بالشات', '<p>اضافة خاصية ارسال رسائل صوتيه وصور ووسائط بالشات .</p>', 57, 3, 4, 730, '2022-04-18 16:15:23', '2022-04-18 16:15:23'),
(30, 'صفحتا العمولة والحسابات البنكية', '<p>اضافه او تغيير صفحة العمولة بحيث تشمل بيانات الحسابات البنكية ومبلغ العمولة المحمول وارفاق صورة التحويل ، وحاسبة للعمولة بناءا على النسبة المحددة من اللوحة .</p>', 57, 3, 4, 730, '2022-04-18 16:17:17', '2022-04-18 16:17:17'),
(31, 'لوحة التحكم', NULL, 74, 1, 4, 736, '2022-04-18 16:34:00', '2022-04-18 16:34:29'),
(32, 'التطبيق', NULL, 74, 1, 4, 736, '2022-04-18 16:38:58', '2022-04-18 16:38:58'),
(33, 'سجل فى حالة التصفير البرنامج والاصناف', '<p>عمل ملف سجل فى حالة تصفير لبرنامج او الاصناف </p><p>يسجيل فيه اسم المستخدم والوقت والاى بى الى عمل منه التصفير </p>', 1, 1, 2, 696, '2022-04-19 05:06:25', '2022-04-19 05:06:25'),
(34, 'تفعيل وايقاف موديلات فى التسطيب', '<p>عمل تفعيل وايقاف للموديلات من خلال التسطيب</p>', 1, 2, 3, 696, '2022-04-20 19:26:11', '2022-04-20 19:26:11'),
(35, 'اضافه ايام العطلات', '<p>اضافه ايام العطلات </p><p>وتلوين تقرير تاسكات الموظفين بايام العطلات</p>', 16, 3, 3, 696, '2022-04-21 16:24:52', '2022-04-21 16:24:52'),
(36, 'تفعيل وايقاف موديلات فى النسخه الاون لاين وقيم التجديد والاشتراكات', '<p>تفعيل وايقاف الموديولات فى النسخه الاون لاين مع مراعات قيمه الاشتراك واماكينه تفعليها للعملا او ايقفها </p>', 1, 2, 3, 696, '2022-04-21 19:22:50', '2022-04-21 19:22:50'),
(37, 'منع حفظ التاريخ بصفر', '<p>مشكله تظهر احيانا بحفظ التاريخ ب 000</p><p><br></p><p>يمكن ان يكون بسبب الكلابيندر فالتاكد قبل الحفظ من التاريخ&nbsp;</p><p><br></p><p>ظهر ت عند عملاء مثل هلا سيهات&nbsp;</p>', 1, 1, 1, 696, '2022-04-23 16:39:23', '2022-04-23 16:39:23'),
(38, 'تصحيح مقانة اقل سعر بيع للمنتج بسعر شراء اعلى منه', '<p>مطلوب عمل مقارنة عند عمل فاتورة مشتريات بسعر الشراء لهذا الصنف واقل سعر بيع له بحيث لو كان سعر الشراء اعلى من اقل سعر بيع للمنتج يرفض البرنامج الحفظ</p><p>ومطلوب ان يتم سؤال العميل كل مرة عن اسم المورد عند عمل فاتورة مشتريات او يتم مسح المورد تلقائي ولا يحفظ البرنامج الا بعد اختيار اسم المورد</p>', 1, 5, 1, 732, '2022-04-23 18:07:59', '2022-04-23 18:09:36'),
(39, 'تنبيه فى حاله تغير تاريخ الجهاز عن تاريخ السيرفر', '<p>تنبيه فى الرئيسيه او اعلى شاشه المبيعات فى حاله وجود اختلاف بين تاريخ الكاليندر وتاريخ السيرفر </p>', 1, 1, 3, 696, '2022-04-26 20:34:13', '2022-04-26 20:34:13'),
(40, 'مراجعه تسجيل نشاط المستخدم', '<p>مراجع تسجيل نشاط المستخدم فى كامل التعديل والحذف </p><p>وايضا تعديل الاعدادات </p><p>وتسجيل </p><p>IP </p><p>الخاص بالدخول للمستخدم </p>', 1, 3, 3, 696, '2022-04-27 15:49:14', '2022-04-27 15:49:14'),
(41, 'فلتر فى تقارير Weekly Tasks', '<p>اضافه فلتر بالمشروع والموظف فى تقرير الاسبوعى للمهام </p>', 16, 1, 4, 696, '2022-04-28 15:18:36', '2022-04-28 15:18:36'),
(42, 'مراجعه تسلسل الفواتير يدوى', '<p>التاكد من عدم تكرار ارقام الفواتير فى حاله تسجيل رقم الفاتوره يدوى</p><p>وفى حالة فتح اكثر من متصفح لتسجيل الفواتير وتاكد من تنبيه المستخدم بانرقم الفاتوره سجل من قبل وعدم حفظ الفاتوره لينتبه العميل بضرروه تغير الرقم او الغاء الخاصية من الاعدادت </p>', 1, 1, 1, 696, '2022-04-30 15:26:09', '2022-04-30 15:26:57'),
(43, 'ترتيب عرض الباك لوك', '<p>امكانيه ترتيب العرض اما بالاحدث او بالنقاط او بالاولية للباك لوج</p>', 16, 2, 3, 696, '2022-04-30 15:32:14', '2022-04-30 15:32:14'),
(44, 'اضافه ترتيب عارض للمهام فى كل المهما', '<p>اماكنيه ترتيب عرض المهام حسب التاريخ او حسب الاولية </p>', 16, 2, 3, 696, '2022-04-30 15:33:14', '2022-04-30 15:33:14'),
(45, 'عمل باك للتركيب للعملاء', '<p>عمل نظام تفعيل للنسخه للعميل من قبل فريق المبيعات </p>', 8, 3, 3, 696, '2022-04-30 15:35:17', '2022-04-30 15:35:17'),
(46, 'التحقق من اختيار العميل', '<p>التحقق قبل الحفظ من اختيار العميل وان الطلب رايح ببيانات عميل فى حاله ان العميل تلقائى محدد</p><p>جافا اسكربت لعدم رجوع خطا بحفظ الفاتوره </p>', 1, 1, 3, 696, '2022-05-09 14:36:40', '2022-05-09 14:36:40'),
(47, 'الصوت فى حالة ان الباركود غير مسجل فى شاشه الضغط', '<p>اضافه تشغيل ملف الصوت فى شاشه الضفط </p><p>فى حالة ان الباركود غير مسجل </p>', 1, 1, 2, 696, '2022-05-12 01:47:07', '2022-05-12 01:47:07'),
(48, 'التاسك الفرعيه تكون واضحه رقم التاسك الاساسى وانها فرعية', '<p>فى حالة فتح تاسك فرعيه تكون واضح انها فرعيه لتاسك اساسى  وورضح رقمه </p>', 16, 1, 3, 696, '2022-05-15 01:13:43', '2022-05-15 01:13:43'),
(49, 'Repellendus Nisi sa2', '<p>Do illo amet, molest.2</p>', 78, 4, 2, 736, '2022-05-15 15:30:40', '2022-05-15 15:30:40'),
(50, 'Tempor tempora iusto312312', '<p>Quia sit, veniam, ut.123312</p>', 78, 3, 3, 736, '2022-05-15 15:30:47', '2022-05-15 15:30:47'),
(51, 'تطبيقات', '<p class=\"ql-align-center ql-direction-rtl\"><br></p><p><br></p><p class=\"ql-align-right ql-direction-rtl\"><strong style=\"background-color: transparent; color: rgb(255, 0, 0);\">التطبيق&nbsp;</strong></p><p><br></p><p class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: rgb(255, 255, 0); color: rgb(0, 0, 0);\">الدفع</span></p><ul><li class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: transparent;\">عند الضغط على الاشتراكات والتنقل ل باقات يتم عرض السعر و قيمته&nbsp; بعملة البلد المفتوح بيها تطبيق وليس بالدولار</span></li><li class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: transparent;\">إذا كانت الباقة تحتوى على خصم يتم&nbsp; عرض السعر قبل الخصم وبعد الخصم&nbsp;</span></li></ul><p><br></p><p class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: rgb(255, 255, 0); color: rgb(0, 0, 0);\">كوبونات الخصم</span></p><p><br></p><ul><li class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: transparent;\">يتم اضافة كود الخصم فى حاجه الكود صحيح يتم ظهور رساله بقيمة الخصم واستكمال باقى الدفع بعد خصم قيمة كود</span></li><li class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: transparent;\">اذا كان كود غير صحيح أو منتهى يتم ظهور رساله توضح ان كود غير صحيح ولا يتم حساب قيمة الخصم</span></li></ul><p><br></p><p><br></p><ul><li class=\"ql-align-right ql-direction-rtl\"><span style=\"background-color: transparent;\">تفعل الكراش ليتكس للأندرويد والios</span></li></ul><p><br></p><p><br></p><p><br></p><ul><li><br></li></ul><p><br></p><p><br></p><p><br></p><p><br></p>', 52, 5, 2, 739, '2022-05-16 16:53:21', '2022-05-16 16:53:21'),
(52, 'قراءة الباركود تجاهل السطر الزياده', '<p>قراءة الباركود تجاهل السطر الزياده</p>', 1, 1, 3, 696, '2022-05-16 18:49:10', '2022-05-16 18:49:10'),
(53, 'اخفاء او اظهار العميل من فاتوره مرتجع مبيعات', '<p>عند اخفاء العميل من صفحه المبيعات سواء ضغط او اختيار يجب لخفء العميل من فاتوره مرتجع المبيعات</p>', 1, 1, 3, 747, '2022-05-17 15:03:19', '2022-05-17 15:03:19'),
(54, 'حفظ الفاتوره علي ماتمت من اعدادات', '<p>حفظ الفاتوره علي ماتمت من اعدادات مثلا لو تم بيع صنف شامل  ثم التعديل لمعفي عند فتح الفاتوره القديمه تكون علي الشامل وليس المعفي </p>', 1, 4, 2, 747, '2022-05-17 15:13:14', '2022-05-17 15:13:14'),
(55, 'طلب تطوير علي برنامج البدر مطلوب تطوير في بند التقارير', '<p>بمجرد الوقوف علي اي بند من التقارير ظهور قائمه منسدله علي اسم التقرير موضح فيها اهميه التقارير وخصائصه</p><p><br></p>', 1, 2, 2, 740, '2022-05-17 19:58:09', '2022-05-17 19:58:09'),
(56, 'test', '<p>test </p>', 1, 6, 2, 730, '2022-05-17 20:06:06', '2022-05-17 20:06:06'),
(57, 'إلغاء مده أشتراك', '<p>الغاء مده اشتراك لعميل اون لاين </p><p>وتحديث تاريخ انتهاء الاشتراك الخاص بيه </p><p>مع ذكر سبب الإلغاء </p>', 56, 3, 3, 696, '2022-05-19 19:34:01', '2022-05-19 19:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `enabled`, `created_at`, `updated_at`) VALUES
(5, 0, 'update main', 1, '2022-02-20 08:36:40', '2022-02-20 09:34:41'),
(7, 5, 'sub cat 1', 1, '2022-02-20 08:37:11', '2022-02-20 13:46:45'),
(8, 5, 'main 1', 1, '2022-02-20 12:23:23', '2022-02-20 12:23:23'),
(9, 5, 'main 1', 1, '2022-03-01 19:46:19', '2022-03-01 19:46:19'),
(10, 5, 'main2', 1, '2022-03-01 20:25:47', '2022-03-01 20:25:47'),
(12, 0, 'سسسس', 1, '2022-03-02 20:17:04', '2022-03-02 20:17:04'),
(13, 0, 'some test', 0, '2022-03-02 20:17:12', '2022-03-08 19:10:46'),
(14, 5, 'سسسساشححع', 1, '2022-03-02 20:17:25', '2022-03-02 20:17:25'),
(15, 0, 'new category', 1, '2022-03-09 17:36:05', '2022-03-09 17:36:05'),
(16, 13, 'dasdsa', 1, '2022-03-09 17:36:39', '2022-03-09 17:36:39'),
(17, 0, 'new main category', 0, '2022-03-14 16:16:28', '2022-03-14 16:16:28'),
(18, 17, 'new main category', 0, '2022-03-14 16:17:23', '2022-03-14 16:17:23'),
(19, 0, 'test_main', 1, '2022-03-16 16:51:52', '2022-03-16 16:51:52'),
(20, 0, 'test_main_lat', 1, '2022-03-16 16:52:26', '2022-03-16 16:52:26'),
(21, 19, 'tett2', 1, '2022-03-16 17:07:17', '2022-03-16 17:07:17'),
(22, 19, 'tett2', 1, '2022-03-16 17:07:40', '2022-03-16 17:07:40'),
(23, 19, 'tett2', 1, '2022-03-16 17:07:44', '2022-03-16 17:07:44'),
(24, 19, 'tett2', 1, '2022-03-16 17:07:46', '2022-03-16 17:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `Organization_Name` varchar(255) DEFAULT NULL,
  `RegistrationNumber` varchar(45) DEFAULT NULL,
  `TaxID` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Zip` varchar(5) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `Saturday` int(11) DEFAULT NULL,
  `Sunday` int(11) DEFAULT NULL,
  `Monday` int(11) DEFAULT NULL,
  `Tuesday` int(11) DEFAULT NULL,
  `Wednesday` int(11) DEFAULT NULL,
  `Thursday` int(11) DEFAULT NULL,
  `Configurationcol` int(11) DEFAULT NULL,
  `Friday` int(11) DEFAULT NULL,
  `MailSentAs` varchar(255) DEFAULT NULL,
  `SMTPHost` varchar(255) DEFAULT NULL,
  `SMTPPort` int(11) DEFAULT NULL,
  `SMTPAuthentication` varchar(45) DEFAULT NULL,
  `SMTPUser` varchar(45) DEFAULT NULL,
  `SMTPPassword` varchar(45) DEFAULT NULL,
  `SecureConnection` varchar(45) DEFAULT NULL,
  `photopath` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contracttype`
--

CREATE TABLE `contracttype` (
  `id` int(11) NOT NULL,
  `contract_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) NOT NULL,
  `e_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `e_nationality` varchar(255) NOT NULL,
  `a_nationality` varchar(255) NOT NULL,
  `e_currency` varchar(200) NOT NULL,
  `a_currency` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `joinedDate` date DEFAULT NULL,
  `gendr` int(11) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `vac_cuurent` int(11) DEFAULT NULL,
  `vac_count` int(11) DEFAULT NULL,
  `vac_balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data22`
--

CREATE TABLE `data22` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `joinedDate` date DEFAULT NULL,
  `gendr` int(11) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debit`
--

CREATE TABLE `debit` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `debittype_id` int(11) NOT NULL,
  `debitvalue` decimal(10,2) NOT NULL,
  `days` int(11) NOT NULL,
  `date` date NOT NULL,
  `notes` text NOT NULL,
  `type` int(2) NOT NULL COMMENT '1--> late debit , 2-->early debit',
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debitsettings`
--

CREATE TABLE `debitsettings` (
  `id` int(11) NOT NULL,
  `late1_time` varchar(255) NOT NULL,
  `late1_ratio` varchar(255) NOT NULL,
  `late2_time` varchar(255) NOT NULL,
  `late2_ratio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debittype`
--

CREATE TABLE `debittype` (
  `id` int(11) NOT NULL,
  `debitname` varchar(255) NOT NULL,
  `debittype` int(1) NOT NULL COMMENT 'money-->1 , days-->2 , minutes-->3',
  `debitvalue` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `default_folders`
--

CREATE TABLE `default_folders` (
  `id` int(11) NOT NULL,
  `folder_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upper_folder` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `description` text,
  `up_depart` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `educationlevel` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `empcomponent`
--

CREATE TABLE `empcomponent` (
  `id` int(11) NOT NULL,
  `em_id` int(11) DEFAULT NULL,
  `Com_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `Comments` text,
  `DirectDeposit` tinyint(1) DEFAULT NULL,
  `AccountNumber` int(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `finger_id` int(255) DEFAULT NULL,
  `National_ID` varchar(45) DEFAULT NULL COMMENT 'الرقم ?',
  `gendr` tinyint(1) DEFAULT NULL COMMENT 'النوع ',
  `nationality_id` int(11) NOT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `photo` text,
  `address` text,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `home_tele` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `work_tele` varchar(20) DEFAULT NULL,
  `work_email` varchar(45) DEFAULT NULL,
  `mergency_name` varchar(255) DEFAULT NULL,
  `mergency_relation` varchar(45) DEFAULT NULL,
  `mergency_tele1` varchar(20) DEFAULT NULL,
  `mergency_tele2` varchar(20) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `jobcategory_id` int(11) DEFAULT NULL,
  `joinedDate` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `contract_file` text,
  `contract_sate` int(11) DEFAULT NULL,
  `Terminate_reson` text,
  `Terminate_date` date DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `salary` int(255) NOT NULL,
  `api_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `full_name`, `finger_id`, `National_ID`, `gendr`, `nationality_id`, `marital_status`, `date_of_birth`, `photo`, `address`, `city`, `state`, `zip`, `country_id`, `home_tele`, `mobile`, `work_tele`, `work_email`, `mergency_name`, `mergency_relation`, `mergency_tele1`, `mergency_tele2`, `job_id`, `contract_type`, `jobcategory_id`, `joinedDate`, `department_id`, `location_id`, `group_id`, `start_date`, `end_date`, `contract_file`, `contract_sate`, `Terminate_reson`, `Terminate_date`, `user_name`, `password`, `login_status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `salary`, `api_token`) VALUES
(687, 'محمود عرفات', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mahmoudarafat33@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'mahmoudarafat', '62b03cbb0a809cb37b32f990d3425dc3', 1, 19, 'C3PVBFn9RcNJhYCQhYccCHGKqRFaWGFvaCVdqWnhuqQgMbVH14L8bT5ZATo8', '2022-06-01 06:53:06', '2022-06-01 08:53:06', 0, '8mxXFvvcyEDwq2M00KwXl5Yg5Jwmy3mFxG3yhZoTJfpMVG0AKQo95ru8lZAp'),
(688, 'عبد القادر فاروق', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'qader', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-23 13:41:50', '2022-05-23 15:41:50', 0, 'szN6Mf8SB0zeUMNj5mr2jsFPxYfLQu8Kdas4F0gAfhkEDjPdMqJjmijOz4G2'),
(690, 'محمد رشدي', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'roshdy', 'fd7477d4332033bc9a918421609670b1', 1, NULL, 'yQsrVr7FG60cIbCklhnrc6iZ5bzZ8DjscYbI2TEkW5OlvoA8dwdD5G7UnaTB', '2022-05-30 09:34:35', '2022-05-30 11:34:35', 0, '0MccG3AgdU6TVTWytgpBX7MDiJQ3lszMZLvO3Bv7sk0G8mDGpR6XcYYyavdp'),
(691, 'محمد رمضان', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ramadan', '202cb962ac59075b964b07152d234b70', 1, NULL, 'Rtcwk1NhaArOVvFbHGnrMiYLfHsVmXWgfOcSSTmbAvvVug7MU4iqa9axUUiq', '2022-05-31 13:50:54', '2022-05-31 15:50:54', 0, '1w58F6i6JLK5PeyqD3EXKwZdlYGt8wzezJ8l7PYXWvvU53WMfcZ7jvFOu9Kc'),
(693, 'أحمد جلال', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'galal', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'izZ37DaYmaBuGMc0ABnUZs8a9LdUN0IccrpPjUb9SfUTxoY8FbgTluPUMcqk', '2022-05-25 07:32:09', '2022-05-25 09:32:09', 0, '46ngrZaErdqgpFgxt6qz4wvhBgIYD65GHxlgKD6WUpQSApSLvaCBlJr9vgx2'),
(695, 'حاتم جودة', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'hatem', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'OltuZGX3ixFowgCCWO7WsJrk17z9pM14PurpI6zijscdIh50BQ3pEnuuFLTX', '2021-02-09 08:47:14', '2018-07-27 20:37:07', 0, NULL),
(696, 'محمود الزيادي', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'melzaiady', '47ad41c7ec8e977816cbec9b02b475b9', 1, 19, 'RO71vHtMVskCVELl0JQ08Bg18KvCbLZPgwFL08WCjIirHO8uuHWJ1d1luYxm', '2022-06-02 08:20:09', '2022-06-02 10:20:09', 0, 'Tl21Jofc2ghACum9oDO05UQqZXlmscIokXK2Mj7XFywcCaqr0542AmFHinhj'),
(698, 'محمود رجائي', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ragaey', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'NkBwclKa2Z6g3QuzUPgyezmfkd9TB25iagi0LcNgTn3dNsulqTXeFSFEIfVP', '2022-06-01 09:14:33', '2022-06-01 11:14:33', 0, 'hze3RNPMRIMBfUcTJW9qpFSbEc0Xhvr5VuKJz5dWP1f1GegqBIibYPxgZk3D'),
(699, 'أحمد الرفاعي', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmad', '0a629739ddd63421d1ae20cb30e850f1', 1, 19, 'AomedbxknIrUboWGAS3jjoMGRvCXPJOaZlvdanXHugHRHT3s3uYQBRIvD2Mx', '2022-05-17 11:00:33', '2022-05-17 13:00:33', 0, 'EkOI9DBNXGMYY2WqTCxx7w8Of4GnST9Qgoh4CFBdOCP9y4QOPkafQvG6djdc'),
(700, 'صالح الغباري', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'saleh', '0ed9422357395a0d4879191c66f4faa2', 1, NULL, 'WO9CwfvjBa4oEn0CLfJ4VtThXvUJ5gCNAXtPjrMMiS70LcXMaVhbk24Kz2WG', '2022-06-01 10:43:41', '2022-06-01 12:43:41', 0, 'KJVTvEKmS0E9lc4jJQgAWYsYVrY7J7YcDzGxYN2k1Ltx50PoGdnCiqr9Uma3'),
(701, 'فايزة محمد', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'fayza', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'OQToIwM9ij7T16ZF4Gx2dld86pDvSube25bJeAZAVF5jbQFn1oUZxsjBArs3', '2022-05-22 07:25:44', '2022-05-22 09:25:44', 0, '6bnch4sTVhLhL6L4h0Vd9SIAgyAhFKKH43RZQBHARKHLMN6KptTDO2aASShv'),
(703, 'سماح', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'samah', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'jT5ECvranDOds2GGqF2uYUJIDBKoXsKrVTkg0z34c4Yoj5hEVVUHlEi0PP3F', '2022-05-17 03:43:41', '2021-01-17 07:23:21', 0, NULL),
(706, 'محمد منير', 31, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'king', '88ebacd96557ab8edc740988c12e475a', 0, NULL, '6xgm7Ekk8UFQE4wfxnURRRagIZLhWCfeShS7f7m6XrtX3EsQJEYGvnaelP6w', '2022-05-17 03:43:41', '2021-01-16 16:16:25', 0, NULL),
(707, 'المهندسة اسلام', 0, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'islam', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'zkdVI8j3605wohd8owMXkIOV3zcLbGZaCPGSUsXcqKfHngiLEG7BkRNQ33M8', '2022-06-02 09:22:33', '2022-06-02 11:22:33', 0, 'hBonnWyOkj1OPdILPN5bYU4d62FrbRty5kuXhP91qXmPszQEtr8yNPaUNIQM'),
(709, 'كريم', 3400, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'karem', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'CPBGcWOMl5M3iw5h6T0leBpYdxa5BKomzDheLRIfhI9qC1uwwsKfSf978yLW', '2022-05-17 03:43:41', '2021-03-15 09:07:30', 0, NULL),
(719, 'a7mdsalah', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a7mdsalah@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'احمد صلاح', 'd41d8cd98f00b204e9800998ecf8427e', 1, 19, 'TpLSis8rVBjmRRtI3kANIfbqkaYmsMUyiWO0DvAKlt0X3OKbhgItb2ybnYTb', '2022-05-17 03:43:41', '2022-03-19 09:09:47', 0, NULL),
(720, 'محمد عبد الحميد', NULL, NULL, NULL, 1234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'abdelhamid', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'sTfYKevCF4r1fRdFgR6NdO4D0b9ffIoPTDrqZDsgdU9FmGgMhhB5gKEldPkq', '2021-02-09 08:47:58', '2018-07-27 02:24:42', 0, NULL),
(721, 'احمد عباس', NULL, NULL, NULL, 1234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmedabas', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'MDHSgfCJ1F81Tlg2ah1fKznuZ53gonErrRXrp23JRhbkt4BrezD2kn5C0isu', '2022-05-29 09:10:26', '2022-05-29 11:10:26', 0, 'ejAPrJVp6bJMRNGR7XzUCdrCxb3nHV2ZX9g3KX9O2lV6QG9Xv835N2gmdfXi'),
(722, 'محمد اشرف', 2528, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'mashraf', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'SB7JXd4nhaxCLONRSJq2gZm0A2ls8wCZNYv9ZScBqOTv8NCm9b3vwceBK3EN', '2022-05-17 03:43:41', '2021-01-17 06:13:52', 0, NULL),
(724, 'محمد الرفاعي', NULL, NULL, NULL, 1233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'elrefaiy76', 'bf3e5945fdb263ed009c4a8c524050cb', 0, NULL, 'DrAatun29512nDC2fZsz0p1xXe5sMnmLbM2YAaJzx2klhTHjhSx3wHhTyIOU', '2022-01-29 08:41:34', '2019-11-27 17:24:18', 0, NULL),
(725, 'محمد متولى', NULL, NULL, NULL, 1233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'metwally', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'P38KKggZM1nkuN3kDMRD1QRIOdsLuSXVOEEMNB6BFT839nRhrD1dGRYzVf7U', '2022-05-17 03:43:41', '2022-04-06 14:11:57', 0, NULL),
(727, 'الهام راشد', NULL, NULL, NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'elham_rashed', 'e10adc3949ba59abbe56e057f20f883e', 0, 19, 'o9TVLuFCgnmxP9CBKLz48Hw2JXpOlJO3DiOmdEhfQl1I9RRWbmCRvg4EPkMm', '2022-05-17 03:43:41', '2019-11-27 17:24:18', 0, NULL),
(728, 'ايهاب احمد', NULL, NULL, NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ehab_ahmed', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'oVR1LlT9btyt5CZI6QaQmNSBKFQThCWAFMdopCEFr5HVCGat8w7YfKicQF78', '2022-05-28 08:54:34', '2022-05-28 10:54:34', 0, 'IVWnAQnJYYmMyjN7F20S4Q3i5hKkOkwlytpTia0KHjhWtgsPLOWnl7LR0V97'),
(729, 'نورهان رضا', NULL, NULL, NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'nourhan_reda', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'LYZZHIXNt15m7eh3hroRAadnxZ2rrl6r4ndDF1P7tYkQoPHi4n7H6RcNl8YT', '2022-05-17 03:43:41', '2021-01-16 20:01:51', 0, NULL),
(730, 'محمد فاضل', NULL, NULL, NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'mohammad_fadel', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'tgFSNe3wEBSbSciZiP6Rn377bz5JidaVY29LvYVFDe08etmf5jZFUcaH4Dzw', '2022-05-23 11:56:50', '2022-05-23 13:56:50', 0, 'cWanvD3uv5dJ1asPgKxJOsANSySUbQ3Q8HNCJbZnXcmHAZq4cds1LD4ThABf'),
(732, 'وليد الجوجري', NULL, NULL, NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'waleed_gogary', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'AvpvbcyENr7AtgNGb7kBGpJzy5Uj0trpZZaWg5NVTIv8T8Xj1p2vYMqHaD4L', '2022-05-22 14:04:49', '2022-05-22 16:04:49', 0, 'KxEOvlJtxXjmLDlANvLXfy3rNbKDUXC2M4xgBaqqOC4sni9vHIwe4jvQGtdg'),
(733, 'عبد الله الكشاف', NULL, '1231321', NULL, 12334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'abd_allah_kshaf', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-18 06:44:07', '2022-05-18 08:44:07', 0, 'UbZVNX9eq3HRmAyScFYwThP1mH0R22sShelY6dJnYKyTuxXLpWKF1sSd5mqp'),
(735, 'مصطفى فلوس ', NULL, NULL, NULL, 1233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'f1', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-18 08:48:13', '2022-05-18 10:48:13', 0, 'WdyCCvBG37oizPjQn1Ol6vSi0lrwRWF4zE3hJ0gNVK4d4a4yywwGl4NmGmlE'),
(736, 'محمود الشناوى', NULL, NULL, NULL, 1233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'm1', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '9aEkTPeRYLz3AeSCKUpLTh4vOYec9kkhOS5VadTzjDmGSijBtWBceWztflFv', '2022-05-22 06:48:33', '2022-05-22 08:48:33', 0, 'nPFHIQRF87krqUNGmywFxsISh0Kioy5ejaTQ1lhFOIy13rE9XJq85Ex5Uy9M'),
(737, 'عبدالله فاروق', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ibnfarouk', '202cb962ac59075b964b07152d234b70', 0, NULL, 'Rtcwk1NhaArOVvFbHGnrMiYLfHsVmXWgfOcSSTmbAvvVug7MU4iqa9axUUiq', '2022-05-17 03:43:41', '2020-12-31 09:41:50', 0, NULL),
(738, 'مصطفى الوكيل', NULL, NULL, NULL, 1233333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'mostafa1', 'e10adc3949ba59abbe56e057f20f883e', 1, 19, 'df8cVpY2XmcT3r8hZVYgL7b2q3jh2pfgBj7Tn0Dd8XEI1p5XX4ut1oAay1TK', '2022-06-02 09:45:15', '2022-06-02 11:45:15', 0, 'qhFRBXdYnl6d2eN8428ChqOEXzdRyoULqzLcocxTeVPPCiPp6PQmHAF0tCqW'),
(739, 'محمد عبدالرازق', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'razik', '202cb962ac59075b964b07152d234b70', 1, NULL, 'Rtcwk1NhaArOVvFbHGnrMiYLfHsVmXWgfOcSSTmbAvvVug7MU4iqa9axUUiq', '2022-06-01 06:52:42', '2022-06-01 08:52:42', 0, 'K2XUPkrQsxqkvIExohzbMPJ1z27ugSVwg09pcqoghJzAR2760FJgA7ARJba0'),
(740, 'تامر أحمد', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'tamer', '202cb962ac59075b964b07152d234b70', 1, NULL, 'Rtcwk1NhaArOVvFbHGnrMiYLfHsVmXWgfOcSSTmbAvvVug7MU4iqa9axUUix', '2022-05-31 09:11:49', '2022-05-31 11:11:49', 0, 'R13EHYt61sbTQ7TYFMeWPJ9thAN1pfd5IusFtBWMthwi3fhYfNsSnUQWB3jU'),
(741, 'وفاء شاهين', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'wafaaShahien', '202cb962ac59075b964b07152d234b70', 1, NULL, '', '2022-06-02 09:14:01', '2022-06-02 11:14:01', 0, 'Yo1y5gqlNbrqvnZzxtZf4q37P9sjTGa3hQodl1IlOG5YV6bnzGKPpNF4olg3'),
(742, 'غسان', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ghsanla288@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ghsan', '202cb962ac59075b964b07152d234b70', 1, NULL, '', '2022-05-31 11:41:52', '2022-05-31 13:41:52', 0, 'pKQ0piou1xVZnvZ7q4dbqrDialKhSuyh8AY0jjZo9ZQgp0uG7NcWV5qQiX59'),
(743, 'احمد الحلو', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'elhelw', '202cb962ac59075b964b07152d234b70', 1, NULL, '', '2022-06-02 07:22:37', '2022-06-02 09:22:37', 0, '62UlQn2hxqCohlr8pOhRPnvZ7aYGuQ8OcPWH0SszfDa2ECLuBtPPN6MVMbQ7'),
(744, 'عادل عزت', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'adelezzat', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'ghdfghdgh', '2022-06-01 11:18:05', '2022-06-01 13:18:05', 0, 'z1bC1T4ifWEIoHuCVjY8LUQGiTVcAU8DeoGdBa95dg1iaggfxRTidc0Ow0vp'),
(745, 'خليل على خليل', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'خليل', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-26 12:30:09', '2022-05-26 14:30:09', 0, 'hTym3VqEs8M4fekklMOVih8CQqKUzvwuxQj3Vktxn8q2sf3dmJQhMkpuczH7'),
(746, 'محمود الأشرم', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'mo7amed21', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-25 08:27:06', '2022-05-25 10:27:06', 0, '9nfu1IRbAlLoO3on543sDvd48qSNSwTIBYxFL8flJoUqXO99x0bRk4vCPB9C'),
(747, 'رضا احمد', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'reda_ahmed', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-31 07:08:30', '2022-05-31 09:08:30', 0, 'RYzOkSolViU1jFv8u25tpuZom64xfG923m4JXrHjpBdBkDce6iB0SvFcnPq6'),
(748, 'أسامة طه', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'osama', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-17 08:06:41', '2022-05-17 10:06:41', 0, 'LNCEeN11qnaERhKytlG9YRe6sIjpOpftYt0xVELDFeV9L40Gpf7pYR4iMuP8'),
(749, 'احمد عصام', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmedessam', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 'FWUSnH4W4QPt39DBs8DIM4XKZbsba3YqGbeH5ThgjjXPBUHOslNQAJlxNNM0', '2022-05-22 07:33:58', '2022-05-22 09:33:58', 0, 'NECaLEazKUofHQxqaXKx2tByT2f4YHQQg422d2ceqqUTPPIW9KVfvHmOjgZF'),
(750, 'محمود بلال', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'belal', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, '', '2022-05-17 03:43:41', '2022-02-16 10:57:44', 0, NULL),
(751, 'sd', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dd@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'dfdf', 'd41d8cd98f00b204e9800998ecf8427e', 0, NULL, '', '2022-05-17 03:43:41', '2022-03-20 08:15:34', 0, NULL),
(752, 'أ -احمد صالح ', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmedsaleh', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-17 03:43:41', '2022-04-21 12:02:15', 0, NULL),
(753, 'حسين عبد المنعم', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'hussein', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-06-02 06:50:54', '2022-06-02 08:50:54', 0, 'K75jdhc9LOESBgsgEve4mi1H51VGFcOUQJyGKD4NCf9rrUyARPBDgpXqBLlr'),
(754, 'أحمد عبد العزيز', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmed_zezo', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-06-02 09:20:48', '2022-06-02 11:20:48', 0, 'QvrGKSiNVFNpOecfxRGexqfBJU641SnQVWVjWOdg6fbpzx2W14USvfmTUhGh'),
(759, 'test11', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'teste2r@teste2r.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, '', '2022-05-17 03:43:41', '2022-05-15 10:41:32', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_permission`
--

CREATE TABLE `employee_permission` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_permission`
--

INSERT INTO `employee_permission` (`id`, `employee_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(167, 739, 1, '2022-04-13 11:11:51', NULL),
(168, 739, 2, '2022-04-13 11:11:51', NULL),
(169, 739, 3, '2022-04-13 11:11:51', NULL),
(170, 739, 4, '2022-04-13 11:11:51', NULL),
(171, 739, 5, '2022-04-13 11:11:51', NULL),
(172, 739, 6, '2022-04-13 11:11:51', NULL),
(173, 739, 7, '2022-04-13 11:11:51', NULL),
(174, 739, 8, '2022-04-13 11:11:51', NULL),
(175, 739, 9, '2022-04-13 11:11:51', NULL),
(176, 739, 10, '2022-04-13 11:11:51', NULL),
(177, 739, 11, '2022-04-13 11:11:51', NULL),
(178, 739, 12, '2022-04-13 11:11:51', NULL),
(179, 739, 13, '2022-04-13 11:11:51', NULL),
(180, 739, 14, '2022-04-13 11:11:51', NULL),
(181, 739, 15, '2022-04-13 11:11:51', NULL),
(182, 739, 16, '2022-04-13 11:11:51', NULL),
(183, 739, 17, '2022-04-13 11:11:51', NULL),
(184, 739, 18, '2022-04-13 11:11:51', NULL),
(185, 739, 19, '2022-04-13 11:11:51', NULL),
(186, 739, 20, '2022-04-13 11:11:51', NULL),
(300, 730, 1, '2022-04-14 08:22:39', NULL),
(301, 730, 2, '2022-04-14 08:22:39', NULL),
(302, 730, 3, '2022-04-14 08:22:39', NULL),
(303, 730, 4, '2022-04-14 08:22:39', NULL),
(304, 730, 5, '2022-04-14 08:22:39', NULL),
(305, 730, 6, '2022-04-14 08:22:39', NULL),
(306, 730, 7, '2022-04-14 08:22:39', NULL),
(307, 730, 8, '2022-04-14 08:22:39', NULL),
(308, 730, 9, '2022-04-14 08:22:39', NULL),
(309, 730, 10, '2022-04-14 08:22:39', NULL),
(310, 730, 11, '2022-04-14 08:22:39', NULL),
(311, 730, 12, '2022-04-14 08:22:39', NULL),
(312, 730, 13, '2022-04-14 08:22:39', NULL),
(313, 730, 14, '2022-04-14 08:22:39', NULL),
(314, 730, 15, '2022-04-14 08:22:39', NULL),
(315, 730, 16, '2022-04-14 08:22:39', NULL),
(316, 730, 17, '2022-04-14 08:22:39', NULL),
(317, 730, 18, '2022-04-14 08:22:39', NULL),
(318, 730, 19, '2022-04-14 08:22:39', NULL),
(319, 730, 20, '2022-04-14 08:22:39', NULL),
(375, 687, 1, '2022-04-14 11:37:43', NULL),
(378, 687, 2, '2022-04-14 11:38:02', NULL),
(379, 687, 3, '2022-04-14 11:38:02', NULL),
(380, 687, 4, '2022-04-14 11:38:02', NULL),
(381, 687, 5, '2022-04-14 11:38:02', NULL),
(382, 687, 6, '2022-04-14 11:38:02', NULL),
(383, 687, 7, '2022-04-14 11:38:02', NULL),
(384, 687, 8, '2022-04-14 11:38:02', NULL),
(385, 687, 9, '2022-04-14 11:38:02', NULL),
(386, 687, 10, '2022-04-14 11:38:02', NULL),
(387, 687, 11, '2022-04-14 11:38:02', NULL),
(388, 687, 12, '2022-04-14 11:38:02', NULL),
(389, 687, 13, '2022-04-14 11:38:02', NULL),
(390, 687, 14, '2022-04-14 11:38:02', NULL),
(391, 687, 15, '2022-04-14 11:38:02', NULL),
(392, 687, 16, '2022-04-14 11:38:02', NULL),
(393, 687, 17, '2022-04-14 11:38:02', NULL),
(394, 687, 18, '2022-04-14 11:38:02', NULL),
(395, 687, 19, '2022-04-14 11:38:02', NULL),
(396, 687, 20, '2022-04-14 11:38:02', NULL),
(832, 691, 2, '2022-04-17 10:41:24', NULL),
(868, 690, 1, '2022-04-17 10:44:50', NULL),
(869, 690, 3, '2022-04-17 10:44:50', NULL),
(872, 691, 4, '2022-04-17 10:52:54', NULL),
(873, 691, 5, '2022-04-17 10:52:54', NULL),
(874, 691, 6, '2022-04-17 10:52:54', NULL),
(875, 691, 7, '2022-04-17 10:52:54', NULL),
(876, 691, 8, '2022-04-17 10:52:54', NULL),
(877, 691, 9, '2022-04-17 10:52:54', NULL),
(878, 691, 10, '2022-04-17 10:52:54', NULL),
(879, 691, 11, '2022-04-17 10:52:54', NULL),
(880, 691, 12, '2022-04-17 10:52:54', NULL),
(881, 691, 13, '2022-04-17 10:52:54', NULL),
(882, 691, 14, '2022-04-17 10:52:54', NULL),
(883, 691, 15, '2022-04-17 10:52:54', NULL),
(884, 691, 16, '2022-04-17 10:52:54', NULL),
(885, 691, 17, '2022-04-17 10:52:54', NULL),
(886, 691, 18, '2022-04-17 10:52:54', NULL),
(887, 691, 19, '2022-04-17 10:52:54', NULL),
(888, 691, 20, '2022-04-17 10:52:54', NULL),
(889, 691, 3, '2022-04-17 10:52:54', NULL),
(895, 693, 5, '2022-04-17 10:53:38', NULL),
(921, 693, 6, '2022-04-17 10:55:26', NULL),
(922, 693, 7, '2022-04-17 10:55:26', NULL),
(923, 693, 8, '2022-04-17 10:55:26', NULL),
(924, 693, 9, '2022-04-17 10:55:26', NULL),
(925, 693, 10, '2022-04-17 10:55:26', NULL),
(926, 693, 11, '2022-04-17 10:55:26', NULL),
(927, 693, 12, '2022-04-17 10:55:26', NULL),
(928, 693, 13, '2022-04-17 10:55:26', NULL),
(929, 693, 14, '2022-04-17 10:55:26', NULL),
(930, 693, 15, '2022-04-17 10:55:26', NULL),
(931, 693, 16, '2022-04-17 10:55:26', NULL),
(932, 693, 17, '2022-04-17 10:55:26', NULL),
(933, 693, 18, '2022-04-17 10:55:26', NULL),
(934, 693, 19, '2022-04-17 10:55:26', NULL),
(935, 693, 20, '2022-04-17 10:55:26', NULL),
(1244, 736, 1, '2022-04-17 11:28:58', NULL),
(1245, 736, 2, '2022-04-17 11:28:58', NULL),
(1246, 736, 3, '2022-04-17 11:28:58', NULL),
(1247, 736, 4, '2022-04-17 11:28:58', NULL),
(1248, 736, 5, '2022-04-17 11:28:58', NULL),
(1249, 736, 6, '2022-04-17 11:28:58', NULL),
(1250, 736, 7, '2022-04-17 11:28:58', NULL),
(1251, 736, 8, '2022-04-17 11:28:58', NULL),
(1252, 736, 9, '2022-04-17 11:28:58', NULL),
(1253, 736, 10, '2022-04-17 11:28:58', NULL),
(1254, 736, 11, '2022-04-17 11:28:58', NULL),
(1255, 736, 12, '2022-04-17 11:28:58', NULL),
(1256, 736, 13, '2022-04-17 11:28:58', NULL),
(1257, 736, 14, '2022-04-17 11:28:58', NULL),
(1258, 736, 15, '2022-04-17 11:28:58', NULL),
(1259, 736, 16, '2022-04-17 11:28:58', NULL),
(1260, 736, 17, '2022-04-17 11:28:58', NULL),
(1261, 736, 18, '2022-04-17 11:28:58', NULL),
(1262, 736, 19, '2022-04-17 11:28:58', NULL),
(1263, 736, 20, '2022-04-17 11:28:58', NULL),
(1861, 707, 2, '2022-04-17 11:56:35', NULL),
(1862, 707, 1, '2022-04-17 11:56:35', NULL),
(2053, 757, 12, '2022-04-18 06:35:30', NULL),
(2055, 757, 14, '2022-04-18 06:35:30', NULL),
(2097, 688, 13, '2022-04-19 07:38:25', NULL),
(2098, 688, 15, '2022-04-19 07:38:25', NULL),
(2099, 688, 1, '2022-04-19 07:38:30', NULL),
(2100, 688, 2, '2022-04-19 07:38:30', NULL),
(2101, 688, 3, '2022-04-19 07:38:30', NULL),
(2102, 688, 4, '2022-04-19 07:38:30', NULL),
(2103, 688, 5, '2022-04-19 07:38:30', NULL),
(2104, 688, 6, '2022-04-19 07:38:30', NULL),
(2105, 688, 7, '2022-04-19 07:38:30', NULL),
(2106, 688, 8, '2022-04-19 07:38:30', NULL),
(2107, 688, 9, '2022-04-19 07:38:30', NULL),
(2108, 688, 10, '2022-04-19 07:38:30', NULL),
(2109, 688, 11, '2022-04-19 07:38:30', NULL),
(2110, 688, 12, '2022-04-19 07:38:30', NULL),
(2111, 688, 14, '2022-04-19 07:38:30', NULL),
(2112, 688, 16, '2022-04-19 07:38:30', NULL),
(2113, 688, 17, '2022-04-19 07:38:30', NULL),
(2114, 688, 18, '2022-04-19 07:38:30', NULL),
(2115, 688, 19, '2022-04-19 07:38:30', NULL),
(2116, 688, 20, '2022-04-19 07:38:30', NULL),
(2117, 757, 1, '2022-04-20 07:22:29', NULL),
(2118, 757, 2, '2022-04-20 07:22:29', NULL),
(2119, 757, 3, '2022-04-20 07:22:29', NULL),
(2120, 757, 4, '2022-04-20 07:22:29', NULL),
(2121, 757, 5, '2022-04-20 07:22:29', NULL),
(2122, 757, 6, '2022-04-20 07:22:29', NULL),
(2123, 757, 7, '2022-04-20 07:22:29', NULL),
(2124, 757, 8, '2022-04-20 07:22:29', NULL),
(2125, 757, 9, '2022-04-20 07:22:29', NULL),
(2126, 757, 10, '2022-04-20 07:22:29', NULL),
(2127, 757, 11, '2022-04-20 07:22:29', NULL),
(2128, 757, 13, '2022-04-20 07:22:29', NULL),
(2129, 757, 15, '2022-04-20 07:22:29', NULL),
(2130, 757, 16, '2022-04-20 07:22:29', NULL),
(2131, 757, 17, '2022-04-20 07:22:29', NULL),
(2132, 757, 18, '2022-04-20 07:22:29', NULL),
(2133, 757, 19, '2022-04-20 07:22:29', NULL),
(2134, 757, 20, '2022-04-20 07:22:29', NULL),
(2135, 690, 2, '2022-05-10 08:16:23', NULL),
(2136, 690, 4, '2022-05-10 08:16:23', NULL),
(2137, 690, 5, '2022-05-10 08:16:23', NULL),
(2138, 690, 6, '2022-05-10 08:16:23', NULL),
(2139, 690, 7, '2022-05-10 08:16:23', NULL),
(2140, 690, 8, '2022-05-10 08:16:23', NULL),
(2141, 690, 9, '2022-05-10 08:16:23', NULL),
(2142, 690, 10, '2022-05-10 08:16:23', NULL),
(2143, 690, 11, '2022-05-10 08:16:23', NULL),
(2144, 690, 12, '2022-05-10 08:16:23', NULL),
(2145, 690, 13, '2022-05-10 08:16:23', NULL),
(2146, 690, 14, '2022-05-10 08:16:23', NULL),
(2147, 690, 15, '2022-05-10 08:16:23', NULL),
(2148, 690, 16, '2022-05-10 08:16:23', NULL),
(2149, 690, 17, '2022-05-10 08:16:23', NULL),
(2150, 690, 18, '2022-05-10 08:16:23', NULL),
(2151, 690, 19, '2022-05-10 08:16:23', NULL),
(2152, 690, 20, '2022-05-10 08:16:23', NULL),
(2153, 696, 1, '2022-05-10 08:16:41', NULL),
(2154, 696, 2, '2022-05-10 08:16:41', NULL),
(2155, 696, 3, '2022-05-10 08:16:41', NULL),
(2156, 696, 4, '2022-05-10 08:16:41', NULL),
(2157, 696, 5, '2022-05-10 08:16:41', NULL),
(2158, 696, 6, '2022-05-10 08:16:41', NULL),
(2159, 696, 7, '2022-05-10 08:16:41', NULL),
(2160, 696, 8, '2022-05-10 08:16:41', NULL),
(2161, 696, 9, '2022-05-10 08:16:41', NULL),
(2162, 696, 10, '2022-05-10 08:16:41', NULL),
(2163, 696, 11, '2022-05-10 08:16:41', NULL),
(2164, 696, 12, '2022-05-10 08:16:41', NULL),
(2165, 696, 13, '2022-05-10 08:16:41', NULL),
(2166, 696, 14, '2022-05-10 08:16:41', NULL),
(2167, 696, 15, '2022-05-10 08:16:41', NULL),
(2168, 696, 16, '2022-05-10 08:16:41', NULL),
(2169, 696, 17, '2022-05-10 08:16:41', NULL),
(2170, 696, 18, '2022-05-10 08:16:41', NULL),
(2171, 696, 19, '2022-05-10 08:16:41', NULL),
(2172, 696, 20, '2022-05-10 08:16:41', NULL),
(2173, 707, 3, '2022-05-10 08:16:58', NULL),
(2174, 707, 4, '2022-05-10 08:16:58', NULL),
(2175, 707, 5, '2022-05-10 08:16:58', NULL),
(2176, 707, 6, '2022-05-10 08:16:58', NULL),
(2177, 707, 7, '2022-05-10 08:16:58', NULL),
(2178, 707, 8, '2022-05-10 08:16:58', NULL),
(2179, 707, 9, '2022-05-10 08:16:58', NULL),
(2180, 707, 10, '2022-05-10 08:16:58', NULL),
(2181, 707, 11, '2022-05-10 08:16:58', NULL),
(2182, 707, 12, '2022-05-10 08:16:58', NULL),
(2183, 707, 13, '2022-05-10 08:16:58', NULL),
(2184, 707, 14, '2022-05-10 08:16:58', NULL),
(2185, 707, 15, '2022-05-10 08:16:58', NULL),
(2186, 707, 16, '2022-05-10 08:16:58', NULL),
(2187, 707, 17, '2022-05-10 08:16:58', NULL),
(2188, 707, 18, '2022-05-10 08:16:58', NULL),
(2189, 707, 19, '2022-05-10 08:16:58', NULL),
(2192, 741, 2, '2022-05-10 08:17:12', NULL),
(2193, 741, 3, '2022-05-10 08:17:12', NULL),
(2194, 741, 4, '2022-05-10 08:17:12', NULL),
(2195, 741, 5, '2022-05-10 08:17:12', NULL),
(2196, 741, 6, '2022-05-10 08:17:12', NULL),
(2197, 741, 7, '2022-05-10 08:17:12', NULL),
(2198, 741, 8, '2022-05-10 08:17:12', NULL),
(2199, 741, 9, '2022-05-10 08:17:12', NULL),
(2200, 741, 10, '2022-05-10 08:17:12', NULL),
(2201, 741, 11, '2022-05-10 08:17:12', NULL),
(2202, 741, 12, '2022-05-10 08:17:12', NULL),
(2203, 741, 13, '2022-05-10 08:17:12', NULL),
(2204, 741, 14, '2022-05-10 08:17:12', NULL),
(2205, 741, 15, '2022-05-10 08:17:12', NULL),
(2206, 741, 16, '2022-05-10 08:17:12', NULL),
(2207, 741, 17, '2022-05-10 08:17:12', NULL),
(2208, 741, 18, '2022-05-10 08:17:12', NULL),
(2209, 741, 19, '2022-05-10 08:17:12', NULL),
(2210, 741, 20, '2022-05-10 08:17:12', NULL),
(2211, 693, 1, '2022-05-10 08:33:01', NULL),
(2212, 693, 2, '2022-05-10 08:33:01', NULL),
(2213, 693, 3, '2022-05-10 08:33:01', NULL),
(2214, 693, 4, '2022-05-10 08:33:01', NULL),
(2215, 698, 1, '2022-05-10 08:33:32', NULL),
(2216, 698, 2, '2022-05-10 08:33:32', NULL),
(2217, 698, 3, '2022-05-10 08:33:32', NULL),
(2218, 698, 4, '2022-05-10 08:33:32', NULL),
(2219, 698, 5, '2022-05-10 08:33:32', NULL),
(2220, 698, 6, '2022-05-10 08:33:32', NULL),
(2221, 698, 7, '2022-05-10 08:33:32', NULL),
(2222, 698, 8, '2022-05-10 08:33:32', NULL),
(2223, 698, 9, '2022-05-10 08:33:32', NULL),
(2224, 698, 10, '2022-05-10 08:33:32', NULL),
(2225, 698, 11, '2022-05-10 08:33:32', NULL),
(2226, 698, 12, '2022-05-10 08:33:32', NULL),
(2227, 698, 13, '2022-05-10 08:33:32', NULL),
(2228, 698, 14, '2022-05-10 08:33:32', NULL),
(2229, 698, 15, '2022-05-10 08:33:32', NULL),
(2230, 698, 16, '2022-05-10 08:33:32', NULL),
(2231, 698, 17, '2022-05-10 08:33:32', NULL),
(2232, 698, 18, '2022-05-10 08:33:32', NULL),
(2233, 698, 19, '2022-05-10 08:33:32', NULL),
(2234, 698, 20, '2022-05-10 08:33:32', NULL),
(2235, 699, 1, '2022-05-10 08:33:40', NULL),
(2236, 699, 2, '2022-05-10 08:33:40', NULL),
(2237, 699, 3, '2022-05-10 08:33:40', NULL),
(2238, 699, 4, '2022-05-10 08:33:40', NULL),
(2239, 699, 5, '2022-05-10 08:33:40', NULL),
(2240, 699, 6, '2022-05-10 08:33:40', NULL),
(2241, 699, 7, '2022-05-10 08:33:40', NULL),
(2242, 699, 8, '2022-05-10 08:33:40', NULL),
(2243, 699, 9, '2022-05-10 08:33:40', NULL),
(2244, 699, 10, '2022-05-10 08:33:40', NULL),
(2245, 699, 11, '2022-05-10 08:33:40', NULL),
(2246, 699, 12, '2022-05-10 08:33:40', NULL),
(2247, 699, 13, '2022-05-10 08:33:40', NULL),
(2248, 699, 14, '2022-05-10 08:33:40', NULL),
(2249, 699, 15, '2022-05-10 08:33:40', NULL),
(2250, 699, 16, '2022-05-10 08:33:40', NULL),
(2251, 699, 17, '2022-05-10 08:33:40', NULL),
(2252, 699, 18, '2022-05-10 08:33:40', NULL),
(2253, 699, 19, '2022-05-10 08:33:40', NULL),
(2254, 699, 20, '2022-05-10 08:33:40', NULL),
(2255, 700, 1, '2022-05-10 08:33:47', NULL),
(2256, 700, 2, '2022-05-10 08:33:47', NULL),
(2257, 700, 3, '2022-05-10 08:33:47', NULL),
(2258, 700, 4, '2022-05-10 08:33:47', NULL),
(2259, 700, 5, '2022-05-10 08:33:47', NULL),
(2260, 700, 6, '2022-05-10 08:33:47', NULL),
(2261, 700, 7, '2022-05-10 08:33:47', NULL),
(2262, 700, 8, '2022-05-10 08:33:47', NULL),
(2263, 700, 9, '2022-05-10 08:33:47', NULL),
(2264, 700, 10, '2022-05-10 08:33:47', NULL),
(2265, 700, 11, '2022-05-10 08:33:47', NULL),
(2266, 700, 12, '2022-05-10 08:33:47', NULL),
(2267, 700, 13, '2022-05-10 08:33:47', NULL),
(2268, 700, 14, '2022-05-10 08:33:47', NULL),
(2269, 700, 15, '2022-05-10 08:33:47', NULL),
(2270, 700, 16, '2022-05-10 08:33:47', NULL),
(2271, 700, 17, '2022-05-10 08:33:47', NULL),
(2272, 700, 18, '2022-05-10 08:33:47', NULL),
(2273, 700, 19, '2022-05-10 08:33:47', NULL),
(2274, 700, 20, '2022-05-10 08:33:47', NULL),
(2295, 721, 1, '2022-05-10 08:36:57', NULL),
(2296, 721, 2, '2022-05-10 08:36:57', NULL),
(2297, 721, 3, '2022-05-10 08:36:57', NULL),
(2298, 721, 4, '2022-05-10 08:36:57', NULL),
(2299, 721, 5, '2022-05-10 08:36:57', NULL),
(2300, 721, 6, '2022-05-10 08:36:57', NULL),
(2301, 721, 7, '2022-05-10 08:36:57', NULL),
(2302, 721, 8, '2022-05-10 08:36:57', NULL),
(2303, 721, 9, '2022-05-10 08:36:57', NULL),
(2304, 721, 10, '2022-05-10 08:36:57', NULL),
(2305, 721, 11, '2022-05-10 08:36:57', NULL),
(2306, 721, 12, '2022-05-10 08:36:57', NULL),
(2307, 721, 13, '2022-05-10 08:36:57', NULL),
(2308, 721, 14, '2022-05-10 08:36:57', NULL),
(2309, 721, 15, '2022-05-10 08:36:57', NULL),
(2310, 721, 16, '2022-05-10 08:36:57', NULL),
(2311, 721, 17, '2022-05-10 08:36:57', NULL),
(2312, 721, 18, '2022-05-10 08:36:57', NULL),
(2313, 721, 19, '2022-05-10 08:36:57', NULL),
(2314, 721, 20, '2022-05-10 08:36:57', NULL),
(2315, 719, 1, '2022-05-10 08:37:07', NULL),
(2316, 719, 2, '2022-05-10 08:37:07', NULL),
(2317, 719, 3, '2022-05-10 08:37:07', NULL),
(2318, 719, 4, '2022-05-10 08:37:07', NULL),
(2319, 719, 5, '2022-05-10 08:37:07', NULL),
(2320, 719, 6, '2022-05-10 08:37:07', NULL),
(2321, 719, 7, '2022-05-10 08:37:07', NULL),
(2322, 719, 8, '2022-05-10 08:37:07', NULL),
(2323, 719, 9, '2022-05-10 08:37:07', NULL),
(2324, 719, 10, '2022-05-10 08:37:07', NULL),
(2325, 719, 11, '2022-05-10 08:37:07', NULL),
(2326, 719, 12, '2022-05-10 08:37:07', NULL),
(2327, 719, 13, '2022-05-10 08:37:07', NULL),
(2328, 719, 14, '2022-05-10 08:37:07', NULL),
(2329, 719, 15, '2022-05-10 08:37:07', NULL),
(2330, 719, 16, '2022-05-10 08:37:07', NULL),
(2331, 719, 17, '2022-05-10 08:37:07', NULL),
(2332, 719, 18, '2022-05-10 08:37:07', NULL),
(2333, 719, 19, '2022-05-10 08:37:07', NULL),
(2334, 719, 20, '2022-05-10 08:37:07', NULL),
(2335, 709, 1, '2022-05-10 08:37:17', NULL),
(2336, 709, 2, '2022-05-10 08:37:17', NULL),
(2337, 709, 3, '2022-05-10 08:37:17', NULL),
(2338, 709, 4, '2022-05-10 08:37:17', NULL),
(2339, 709, 5, '2022-05-10 08:37:17', NULL),
(2340, 709, 6, '2022-05-10 08:37:17', NULL),
(2341, 709, 7, '2022-05-10 08:37:17', NULL),
(2342, 709, 8, '2022-05-10 08:37:17', NULL),
(2343, 709, 9, '2022-05-10 08:37:17', NULL),
(2344, 709, 10, '2022-05-10 08:37:17', NULL),
(2345, 709, 11, '2022-05-10 08:37:17', NULL),
(2346, 709, 12, '2022-05-10 08:37:17', NULL),
(2347, 709, 13, '2022-05-10 08:37:17', NULL),
(2348, 709, 14, '2022-05-10 08:37:17', NULL),
(2349, 709, 15, '2022-05-10 08:37:17', NULL),
(2350, 709, 16, '2022-05-10 08:37:17', NULL),
(2351, 709, 17, '2022-05-10 08:37:17', NULL),
(2352, 709, 18, '2022-05-10 08:37:17', NULL),
(2353, 709, 19, '2022-05-10 08:37:17', NULL),
(2354, 709, 20, '2022-05-10 08:37:17', NULL),
(2356, 703, 2, '2022-05-10 08:37:26', NULL),
(2358, 703, 4, '2022-05-10 08:37:26', NULL),
(2359, 703, 5, '2022-05-10 08:37:26', NULL),
(2360, 703, 6, '2022-05-10 08:37:26', NULL),
(2361, 703, 7, '2022-05-10 08:37:26', NULL),
(2362, 703, 8, '2022-05-10 08:37:26', NULL),
(2363, 703, 9, '2022-05-10 08:37:26', NULL),
(2364, 703, 10, '2022-05-10 08:37:26', NULL),
(2365, 703, 11, '2022-05-10 08:37:26', NULL),
(2367, 703, 13, '2022-05-10 08:37:26', NULL),
(2369, 703, 15, '2022-05-10 08:37:26', NULL),
(2370, 703, 16, '2022-05-10 08:37:26', NULL),
(2371, 703, 17, '2022-05-10 08:37:26', NULL),
(2372, 703, 18, '2022-05-10 08:37:26', NULL),
(2373, 703, 19, '2022-05-10 08:37:26', NULL),
(2374, 703, 20, '2022-05-10 08:37:26', NULL),
(2375, 728, 1, '2022-05-10 08:48:38', NULL),
(2376, 728, 2, '2022-05-10 08:48:38', NULL),
(2377, 728, 3, '2022-05-10 08:48:38', NULL),
(2378, 728, 4, '2022-05-10 08:48:38', NULL),
(2379, 728, 5, '2022-05-10 08:48:38', NULL),
(2380, 728, 6, '2022-05-10 08:48:38', NULL),
(2381, 728, 7, '2022-05-10 08:48:38', NULL),
(2382, 728, 8, '2022-05-10 08:48:38', NULL),
(2383, 728, 9, '2022-05-10 08:48:38', NULL),
(2384, 728, 10, '2022-05-10 08:48:38', NULL),
(2385, 728, 11, '2022-05-10 08:48:38', NULL),
(2386, 728, 12, '2022-05-10 08:48:38', NULL),
(2387, 728, 13, '2022-05-10 08:48:38', NULL),
(2388, 728, 14, '2022-05-10 08:48:38', NULL),
(2389, 728, 15, '2022-05-10 08:48:38', NULL),
(2390, 728, 16, '2022-05-10 08:48:38', NULL),
(2391, 728, 17, '2022-05-10 08:48:38', NULL),
(2392, 728, 18, '2022-05-10 08:48:38', NULL),
(2393, 728, 19, '2022-05-10 08:48:38', NULL),
(2394, 728, 20, '2022-05-10 08:48:38', NULL),
(2395, 732, 1, '2022-05-10 08:51:13', NULL),
(2396, 732, 2, '2022-05-10 08:51:13', NULL),
(2397, 732, 3, '2022-05-10 08:51:13', NULL),
(2398, 732, 4, '2022-05-10 08:51:13', NULL),
(2399, 732, 5, '2022-05-10 08:51:13', NULL),
(2400, 732, 6, '2022-05-10 08:51:13', NULL),
(2401, 732, 7, '2022-05-10 08:51:13', NULL),
(2402, 732, 8, '2022-05-10 08:51:13', NULL),
(2403, 732, 9, '2022-05-10 08:51:13', NULL),
(2404, 732, 10, '2022-05-10 08:51:13', NULL),
(2405, 732, 11, '2022-05-10 08:51:13', NULL),
(2406, 732, 12, '2022-05-10 08:51:13', NULL),
(2407, 732, 13, '2022-05-10 08:51:13', NULL),
(2408, 732, 14, '2022-05-10 08:51:13', NULL),
(2409, 732, 15, '2022-05-10 08:51:13', NULL),
(2410, 732, 16, '2022-05-10 08:51:13', NULL),
(2411, 732, 17, '2022-05-10 08:51:13', NULL),
(2412, 732, 18, '2022-05-10 08:51:13', NULL),
(2413, 732, 19, '2022-05-10 08:51:13', NULL),
(2414, 732, 20, '2022-05-10 08:51:13', NULL),
(2415, 733, 1, '2022-05-10 08:53:11', NULL),
(2416, 733, 2, '2022-05-10 08:53:11', NULL),
(2417, 733, 3, '2022-05-10 08:53:11', NULL),
(2418, 733, 4, '2022-05-10 08:53:11', NULL),
(2419, 733, 5, '2022-05-10 08:53:11', NULL),
(2420, 733, 6, '2022-05-10 08:53:11', NULL),
(2421, 733, 7, '2022-05-10 08:53:11', NULL),
(2422, 733, 8, '2022-05-10 08:53:11', NULL),
(2423, 733, 9, '2022-05-10 08:53:11', NULL),
(2424, 733, 10, '2022-05-10 08:53:11', NULL),
(2425, 733, 11, '2022-05-10 08:53:11', NULL),
(2426, 733, 12, '2022-05-10 08:53:11', NULL),
(2427, 733, 13, '2022-05-10 08:53:11', NULL),
(2428, 733, 14, '2022-05-10 08:53:11', NULL),
(2429, 733, 15, '2022-05-10 08:53:11', NULL),
(2430, 733, 16, '2022-05-10 08:53:11', NULL),
(2431, 733, 17, '2022-05-10 08:53:11', NULL),
(2432, 733, 18, '2022-05-10 08:53:11', NULL),
(2433, 733, 19, '2022-05-10 08:53:11', NULL),
(2434, 733, 20, '2022-05-10 08:53:11', NULL),
(2435, 735, 1, '2022-05-10 08:53:21', NULL),
(2436, 735, 2, '2022-05-10 08:53:21', NULL),
(2437, 735, 3, '2022-05-10 08:53:21', NULL),
(2438, 735, 4, '2022-05-10 08:53:21', NULL),
(2439, 735, 5, '2022-05-10 08:53:21', NULL),
(2440, 735, 6, '2022-05-10 08:53:21', NULL),
(2441, 735, 7, '2022-05-10 08:53:21', NULL),
(2442, 735, 8, '2022-05-10 08:53:21', NULL),
(2443, 735, 9, '2022-05-10 08:53:21', NULL),
(2444, 735, 10, '2022-05-10 08:53:21', NULL),
(2445, 735, 11, '2022-05-10 08:53:21', NULL),
(2446, 735, 12, '2022-05-10 08:53:21', NULL),
(2447, 735, 13, '2022-05-10 08:53:21', NULL),
(2448, 735, 14, '2022-05-10 08:53:21', NULL),
(2449, 735, 15, '2022-05-10 08:53:21', NULL),
(2450, 735, 16, '2022-05-10 08:53:21', NULL),
(2451, 735, 17, '2022-05-10 08:53:21', NULL),
(2452, 735, 18, '2022-05-10 08:53:21', NULL),
(2453, 735, 19, '2022-05-10 08:53:21', NULL),
(2454, 735, 20, '2022-05-10 08:53:21', NULL),
(2455, 744, 1, '2022-05-10 08:54:03', NULL),
(2456, 744, 2, '2022-05-10 08:54:03', NULL),
(2457, 744, 3, '2022-05-10 08:54:03', NULL),
(2458, 744, 4, '2022-05-10 08:54:03', NULL),
(2459, 744, 5, '2022-05-10 08:54:03', NULL),
(2460, 744, 6, '2022-05-10 08:54:03', NULL),
(2461, 744, 7, '2022-05-10 08:54:03', NULL),
(2462, 744, 8, '2022-05-10 08:54:03', NULL),
(2463, 744, 9, '2022-05-10 08:54:03', NULL),
(2464, 744, 10, '2022-05-10 08:54:03', NULL),
(2465, 744, 11, '2022-05-10 08:54:03', NULL),
(2466, 744, 12, '2022-05-10 08:54:03', NULL),
(2467, 744, 13, '2022-05-10 08:54:03', NULL),
(2468, 744, 14, '2022-05-10 08:54:03', NULL),
(2469, 744, 15, '2022-05-10 08:54:03', NULL),
(2470, 744, 16, '2022-05-10 08:54:03', NULL),
(2471, 744, 17, '2022-05-10 08:54:03', NULL),
(2472, 744, 18, '2022-05-10 08:54:03', NULL),
(2473, 744, 19, '2022-05-10 08:54:03', NULL),
(2474, 744, 20, '2022-05-10 08:54:03', NULL),
(2475, 743, 1, '2022-05-10 08:54:09', NULL),
(2476, 743, 2, '2022-05-10 08:54:09', NULL),
(2477, 743, 3, '2022-05-10 08:54:09', NULL),
(2478, 743, 4, '2022-05-10 08:54:09', NULL),
(2479, 743, 5, '2022-05-10 08:54:09', NULL),
(2480, 743, 6, '2022-05-10 08:54:09', NULL),
(2481, 743, 7, '2022-05-10 08:54:09', NULL),
(2482, 743, 8, '2022-05-10 08:54:09', NULL),
(2483, 743, 9, '2022-05-10 08:54:09', NULL),
(2484, 743, 10, '2022-05-10 08:54:09', NULL),
(2485, 743, 11, '2022-05-10 08:54:09', NULL),
(2486, 743, 12, '2022-05-10 08:54:09', NULL),
(2487, 743, 13, '2022-05-10 08:54:09', NULL),
(2488, 743, 14, '2022-05-10 08:54:09', NULL),
(2489, 743, 15, '2022-05-10 08:54:09', NULL),
(2490, 743, 16, '2022-05-10 08:54:09', NULL),
(2491, 743, 17, '2022-05-10 08:54:09', NULL),
(2492, 743, 18, '2022-05-10 08:54:09', NULL),
(2493, 743, 19, '2022-05-10 08:54:09', NULL),
(2494, 743, 20, '2022-05-10 08:54:09', NULL),
(2495, 740, 1, '2022-05-10 08:54:15', NULL),
(2496, 740, 2, '2022-05-10 08:54:15', NULL),
(2497, 740, 3, '2022-05-10 08:54:15', NULL),
(2498, 740, 4, '2022-05-10 08:54:15', NULL),
(2499, 740, 5, '2022-05-10 08:54:15', NULL),
(2500, 740, 6, '2022-05-10 08:54:15', NULL),
(2501, 740, 7, '2022-05-10 08:54:15', NULL),
(2502, 740, 8, '2022-05-10 08:54:15', NULL),
(2503, 740, 9, '2022-05-10 08:54:15', NULL),
(2504, 740, 10, '2022-05-10 08:54:15', NULL),
(2505, 740, 11, '2022-05-10 08:54:15', NULL),
(2506, 740, 12, '2022-05-10 08:54:15', NULL),
(2507, 740, 13, '2022-05-10 08:54:15', NULL),
(2508, 740, 14, '2022-05-10 08:54:15', NULL),
(2509, 740, 15, '2022-05-10 08:54:15', NULL),
(2510, 740, 16, '2022-05-10 08:54:15', NULL),
(2511, 740, 17, '2022-05-10 08:54:15', NULL),
(2512, 740, 18, '2022-05-10 08:54:15', NULL),
(2513, 740, 19, '2022-05-10 08:54:15', NULL),
(2514, 740, 20, '2022-05-10 08:54:15', NULL),
(2515, 738, 1, '2022-05-10 08:54:21', NULL),
(2516, 738, 2, '2022-05-10 08:54:21', NULL),
(2517, 738, 3, '2022-05-10 08:54:21', NULL),
(2518, 738, 4, '2022-05-10 08:54:21', NULL),
(2519, 738, 5, '2022-05-10 08:54:21', NULL),
(2520, 738, 6, '2022-05-10 08:54:21', NULL),
(2521, 738, 7, '2022-05-10 08:54:21', NULL),
(2522, 738, 8, '2022-05-10 08:54:21', NULL),
(2523, 738, 9, '2022-05-10 08:54:21', NULL),
(2524, 738, 10, '2022-05-10 08:54:21', NULL),
(2525, 738, 11, '2022-05-10 08:54:21', NULL),
(2526, 738, 12, '2022-05-10 08:54:21', NULL),
(2527, 738, 13, '2022-05-10 08:54:21', NULL),
(2528, 738, 14, '2022-05-10 08:54:21', NULL),
(2529, 738, 15, '2022-05-10 08:54:21', NULL),
(2530, 738, 16, '2022-05-10 08:54:21', NULL),
(2531, 738, 17, '2022-05-10 08:54:21', NULL),
(2532, 738, 18, '2022-05-10 08:54:21', NULL),
(2533, 738, 19, '2022-05-10 08:54:21', NULL),
(2534, 738, 20, '2022-05-10 08:54:21', NULL),
(2535, 745, 1, '2022-05-10 08:54:39', NULL),
(2536, 745, 2, '2022-05-10 08:54:39', NULL),
(2537, 745, 3, '2022-05-10 08:54:39', NULL),
(2538, 745, 4, '2022-05-10 08:54:39', NULL),
(2539, 745, 5, '2022-05-10 08:54:39', NULL),
(2540, 745, 6, '2022-05-10 08:54:39', NULL),
(2541, 745, 7, '2022-05-10 08:54:39', NULL),
(2542, 745, 8, '2022-05-10 08:54:39', NULL),
(2543, 745, 9, '2022-05-10 08:54:39', NULL),
(2544, 745, 10, '2022-05-10 08:54:39', NULL),
(2545, 745, 11, '2022-05-10 08:54:39', NULL),
(2546, 745, 12, '2022-05-10 08:54:39', NULL),
(2547, 745, 13, '2022-05-10 08:54:39', NULL),
(2548, 745, 14, '2022-05-10 08:54:39', NULL),
(2549, 745, 15, '2022-05-10 08:54:39', NULL),
(2550, 745, 16, '2022-05-10 08:54:39', NULL),
(2551, 745, 17, '2022-05-10 08:54:39', NULL),
(2552, 745, 18, '2022-05-10 08:54:39', NULL),
(2553, 745, 19, '2022-05-10 08:54:39', NULL),
(2554, 745, 20, '2022-05-10 08:54:39', NULL),
(2555, 742, 1, '2022-05-10 08:54:42', NULL),
(2556, 742, 2, '2022-05-10 08:54:42', NULL),
(2557, 742, 3, '2022-05-10 08:54:42', NULL),
(2558, 742, 4, '2022-05-10 08:54:42', NULL),
(2559, 742, 5, '2022-05-10 08:54:42', NULL),
(2560, 742, 6, '2022-05-10 08:54:42', NULL),
(2561, 742, 7, '2022-05-10 08:54:42', NULL),
(2562, 742, 8, '2022-05-10 08:54:42', NULL),
(2563, 742, 9, '2022-05-10 08:54:42', NULL),
(2564, 742, 10, '2022-05-10 08:54:42', NULL),
(2565, 742, 11, '2022-05-10 08:54:42', NULL),
(2566, 742, 12, '2022-05-10 08:54:42', NULL),
(2567, 742, 13, '2022-05-10 08:54:42', NULL),
(2568, 742, 14, '2022-05-10 08:54:42', NULL),
(2569, 742, 15, '2022-05-10 08:54:42', NULL),
(2570, 742, 16, '2022-05-10 08:54:42', NULL),
(2571, 742, 17, '2022-05-10 08:54:42', NULL),
(2572, 742, 18, '2022-05-10 08:54:42', NULL),
(2573, 742, 19, '2022-05-10 08:54:42', NULL),
(2574, 742, 20, '2022-05-10 08:54:42', NULL),
(2575, 754, 1, '2022-05-10 08:55:06', NULL),
(2576, 754, 2, '2022-05-10 08:55:06', NULL),
(2577, 754, 3, '2022-05-10 08:55:06', NULL),
(2578, 754, 4, '2022-05-10 08:55:06', NULL),
(2579, 754, 5, '2022-05-10 08:55:06', NULL),
(2580, 754, 6, '2022-05-10 08:55:06', NULL),
(2581, 754, 7, '2022-05-10 08:55:06', NULL),
(2582, 754, 8, '2022-05-10 08:55:06', NULL),
(2583, 754, 9, '2022-05-10 08:55:06', NULL),
(2584, 754, 10, '2022-05-10 08:55:06', NULL),
(2585, 754, 11, '2022-05-10 08:55:06', NULL),
(2586, 754, 12, '2022-05-10 08:55:06', NULL),
(2587, 754, 13, '2022-05-10 08:55:06', NULL),
(2588, 754, 14, '2022-05-10 08:55:06', NULL),
(2589, 754, 15, '2022-05-10 08:55:06', NULL),
(2590, 754, 16, '2022-05-10 08:55:06', NULL),
(2591, 754, 17, '2022-05-10 08:55:06', NULL),
(2592, 754, 18, '2022-05-10 08:55:06', NULL),
(2593, 754, 19, '2022-05-10 08:55:06', NULL),
(2594, 754, 20, '2022-05-10 08:55:06', NULL),
(2595, 753, 1, '2022-05-10 08:55:10', NULL),
(2596, 753, 2, '2022-05-10 08:55:10', NULL),
(2597, 753, 3, '2022-05-10 08:55:10', NULL),
(2598, 753, 4, '2022-05-10 08:55:10', NULL),
(2599, 753, 5, '2022-05-10 08:55:10', NULL),
(2600, 753, 6, '2022-05-10 08:55:10', NULL),
(2601, 753, 7, '2022-05-10 08:55:10', NULL),
(2602, 753, 8, '2022-05-10 08:55:10', NULL),
(2603, 753, 9, '2022-05-10 08:55:10', NULL),
(2604, 753, 10, '2022-05-10 08:55:10', NULL),
(2605, 753, 11, '2022-05-10 08:55:10', NULL),
(2606, 753, 12, '2022-05-10 08:55:10', NULL),
(2607, 753, 13, '2022-05-10 08:55:10', NULL),
(2608, 753, 14, '2022-05-10 08:55:10', NULL),
(2609, 753, 15, '2022-05-10 08:55:10', NULL),
(2610, 753, 16, '2022-05-10 08:55:10', NULL),
(2611, 753, 17, '2022-05-10 08:55:10', NULL),
(2612, 753, 18, '2022-05-10 08:55:10', NULL),
(2613, 753, 19, '2022-05-10 08:55:10', NULL),
(2614, 753, 20, '2022-05-10 08:55:10', NULL),
(2615, 752, 1, '2022-05-10 08:55:22', NULL),
(2616, 752, 2, '2022-05-10 08:55:22', NULL),
(2617, 752, 3, '2022-05-10 08:55:22', NULL),
(2618, 752, 4, '2022-05-10 08:55:22', NULL),
(2619, 752, 5, '2022-05-10 08:55:22', NULL),
(2620, 752, 6, '2022-05-10 08:55:22', NULL),
(2621, 752, 7, '2022-05-10 08:55:22', NULL),
(2622, 752, 8, '2022-05-10 08:55:22', NULL),
(2623, 752, 9, '2022-05-10 08:55:22', NULL),
(2624, 752, 10, '2022-05-10 08:55:22', NULL),
(2625, 752, 11, '2022-05-10 08:55:22', NULL),
(2626, 752, 12, '2022-05-10 08:55:22', NULL),
(2627, 752, 13, '2022-05-10 08:55:22', NULL),
(2628, 752, 14, '2022-05-10 08:55:22', NULL),
(2629, 752, 15, '2022-05-10 08:55:22', NULL),
(2630, 752, 16, '2022-05-10 08:55:22', NULL),
(2631, 752, 17, '2022-05-10 08:55:22', NULL),
(2632, 752, 18, '2022-05-10 08:55:22', NULL),
(2633, 752, 19, '2022-05-10 08:55:22', NULL),
(2634, 752, 20, '2022-05-10 08:55:22', NULL),
(2635, 749, 1, '2022-05-10 08:55:25', NULL),
(2636, 749, 2, '2022-05-10 08:55:25', NULL),
(2637, 749, 3, '2022-05-10 08:55:25', NULL),
(2638, 749, 4, '2022-05-10 08:55:25', NULL),
(2639, 749, 5, '2022-05-10 08:55:25', NULL),
(2640, 749, 6, '2022-05-10 08:55:25', NULL),
(2641, 749, 7, '2022-05-10 08:55:25', NULL),
(2642, 749, 8, '2022-05-10 08:55:25', NULL),
(2643, 749, 9, '2022-05-10 08:55:25', NULL),
(2644, 749, 10, '2022-05-10 08:55:25', NULL),
(2645, 749, 11, '2022-05-10 08:55:25', NULL),
(2646, 749, 12, '2022-05-10 08:55:25', NULL),
(2647, 749, 13, '2022-05-10 08:55:25', NULL),
(2648, 749, 14, '2022-05-10 08:55:25', NULL),
(2649, 749, 15, '2022-05-10 08:55:25', NULL),
(2650, 749, 16, '2022-05-10 08:55:25', NULL),
(2651, 749, 17, '2022-05-10 08:55:25', NULL),
(2652, 749, 18, '2022-05-10 08:55:25', NULL),
(2653, 749, 19, '2022-05-10 08:55:25', NULL),
(2654, 749, 20, '2022-05-10 08:55:25', NULL),
(2655, 748, 1, '2022-05-10 08:55:31', NULL),
(2656, 748, 2, '2022-05-10 08:55:31', NULL),
(2657, 748, 3, '2022-05-10 08:55:31', NULL),
(2658, 748, 4, '2022-05-10 08:55:31', NULL),
(2659, 748, 5, '2022-05-10 08:55:31', NULL),
(2660, 748, 6, '2022-05-10 08:55:31', NULL),
(2661, 748, 7, '2022-05-10 08:55:31', NULL),
(2662, 748, 8, '2022-05-10 08:55:31', NULL),
(2663, 748, 9, '2022-05-10 08:55:31', NULL),
(2664, 748, 10, '2022-05-10 08:55:31', NULL),
(2665, 748, 11, '2022-05-10 08:55:31', NULL),
(2666, 748, 12, '2022-05-10 08:55:31', NULL),
(2667, 748, 13, '2022-05-10 08:55:31', NULL),
(2668, 748, 14, '2022-05-10 08:55:31', NULL),
(2669, 748, 15, '2022-05-10 08:55:31', NULL),
(2670, 748, 16, '2022-05-10 08:55:31', NULL),
(2671, 748, 17, '2022-05-10 08:55:31', NULL),
(2672, 748, 18, '2022-05-10 08:55:31', NULL),
(2673, 748, 19, '2022-05-10 08:55:31', NULL),
(2674, 748, 20, '2022-05-10 08:55:31', NULL),
(2675, 747, 1, '2022-05-10 08:55:35', NULL),
(2676, 747, 2, '2022-05-10 08:55:35', NULL),
(2677, 747, 3, '2022-05-10 08:55:35', NULL),
(2678, 747, 4, '2022-05-10 08:55:35', NULL),
(2679, 747, 5, '2022-05-10 08:55:35', NULL),
(2680, 747, 6, '2022-05-10 08:55:35', NULL),
(2681, 747, 7, '2022-05-10 08:55:35', NULL),
(2682, 747, 8, '2022-05-10 08:55:35', NULL),
(2683, 747, 9, '2022-05-10 08:55:35', NULL),
(2684, 747, 10, '2022-05-10 08:55:35', NULL),
(2685, 747, 11, '2022-05-10 08:55:35', NULL),
(2686, 747, 12, '2022-05-10 08:55:35', NULL),
(2687, 747, 13, '2022-05-10 08:55:35', NULL),
(2688, 747, 14, '2022-05-10 08:55:35', NULL),
(2689, 747, 15, '2022-05-10 08:55:35', NULL),
(2690, 747, 16, '2022-05-10 08:55:35', NULL),
(2691, 747, 17, '2022-05-10 08:55:35', NULL),
(2692, 747, 18, '2022-05-10 08:55:35', NULL),
(2693, 747, 19, '2022-05-10 08:55:35', NULL),
(2694, 747, 20, '2022-05-10 08:55:35', NULL),
(2695, 746, 1, '2022-05-10 08:55:38', NULL),
(2696, 746, 2, '2022-05-10 08:55:38', NULL),
(2697, 746, 3, '2022-05-10 08:55:38', NULL),
(2698, 746, 4, '2022-05-10 08:55:38', NULL),
(2699, 746, 5, '2022-05-10 08:55:38', NULL),
(2700, 746, 6, '2022-05-10 08:55:38', NULL),
(2701, 746, 7, '2022-05-10 08:55:38', NULL),
(2702, 746, 8, '2022-05-10 08:55:38', NULL),
(2703, 746, 9, '2022-05-10 08:55:38', NULL),
(2704, 746, 10, '2022-05-10 08:55:38', NULL),
(2705, 746, 11, '2022-05-10 08:55:38', NULL),
(2706, 746, 12, '2022-05-10 08:55:38', NULL),
(2707, 746, 13, '2022-05-10 08:55:38', NULL),
(2708, 746, 14, '2022-05-10 08:55:38', NULL),
(2709, 746, 15, '2022-05-10 08:55:38', NULL),
(2710, 746, 16, '2022-05-10 08:55:38', NULL),
(2711, 746, 17, '2022-05-10 08:55:38', NULL),
(2712, 746, 18, '2022-05-10 08:55:38', NULL),
(2713, 746, 19, '2022-05-10 08:55:38', NULL),
(2714, 746, 20, '2022-05-10 08:55:38', NULL),
(2848, 701, 2, '2022-05-17 13:52:42', NULL),
(2850, 701, 4, '2022-05-17 13:52:42', NULL),
(2851, 701, 5, '2022-05-17 13:52:42', NULL),
(2852, 701, 6, '2022-05-17 13:52:42', NULL),
(2853, 701, 7, '2022-05-17 13:52:42', NULL),
(2854, 701, 8, '2022-05-17 13:52:42', NULL),
(2855, 701, 9, '2022-05-17 13:52:42', NULL),
(2856, 701, 10, '2022-05-17 13:52:42', NULL),
(2857, 701, 11, '2022-05-17 13:52:42', NULL),
(2858, 701, 12, '2022-05-17 13:52:42', NULL),
(2859, 701, 13, '2022-05-17 13:52:42', NULL),
(2860, 701, 14, '2022-05-17 13:52:42', NULL),
(2861, 701, 15, '2022-05-17 13:52:42', NULL),
(2862, 701, 16, '2022-05-17 13:52:42', NULL),
(2863, 701, 17, '2022-05-17 13:52:42', NULL),
(2864, 701, 18, '2022-05-17 13:52:42', NULL),
(2865, 701, 19, '2022-05-17 13:52:42', NULL),
(2866, 701, 20, '2022-05-17 13:52:42', NULL),
(2867, 701, 22, '2022-05-17 13:52:42', NULL),
(2868, 701, 24, '2022-05-17 13:52:42', NULL),
(2869, 703, 22, '2022-05-17 14:02:24', NULL),
(2870, 703, 24, '2022-05-17 14:02:24', NULL),
(2872, 701, 3, '2022-05-18 08:01:46', NULL),
(2873, 707, 25, '2022-05-18 08:58:04', NULL),
(2874, 707, 27, '2022-05-18 12:27:53', NULL),
(2875, 707, 29, '2022-05-18 12:27:53', NULL),
(2876, 707, 31, '2022-05-18 12:27:53', NULL),
(2877, 707, 30, '2022-05-18 12:27:53', NULL),
(2878, 707, 28, '2022-05-18 12:27:53', NULL),
(2879, 707, 26, '2022-05-18 12:27:53', NULL),
(2880, 707, 24, '2022-05-19 07:43:02', NULL),
(2881, 741, 22, '2022-05-30 08:34:40', NULL),
(2882, 741, 23, '2022-05-30 08:34:40', NULL),
(2883, 741, 24, '2022-05-30 08:34:40', NULL),
(2884, 741, 25, '2022-05-30 08:34:40', NULL),
(2885, 741, 26, '2022-05-30 08:34:40', NULL),
(2886, 741, 27, '2022-05-30 08:34:40', NULL),
(2887, 741, 28, '2022-05-30 08:34:40', NULL),
(2888, 741, 42, '2022-05-30 08:34:40', NULL),
(2889, 691, 22, '2022-05-31 11:06:31', NULL),
(2890, 691, 23, '2022-05-31 11:06:31', NULL),
(2891, 691, 24, '2022-05-31 11:06:31', NULL),
(2892, 691, 25, '2022-05-31 11:06:31', NULL),
(2893, 691, 26, '2022-05-31 11:06:31', NULL),
(2894, 691, 27, '2022-05-31 11:06:31', NULL),
(2895, 691, 28, '2022-05-31 11:06:31', NULL),
(2896, 691, 42, '2022-05-31 11:06:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_points`
--

CREATE TABLE `employee_points` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `years_experience` int(11) DEFAULT NULL,
  `comment` text,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `id` int(11) NOT NULL,
  `finger_id` varchar(45) DEFAULT NULL,
  `attendan_date` date DEFAULT NULL,
  `Punch_In` time DEFAULT NULL,
  `in_note` text,
  `Punch_out` time DEFAULT NULL,
  `Out_note` text,
  `add_date` timestamp NULL DEFAULT NULL,
  `add_id` int(11) DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `edit_user` int(11) DEFAULT NULL,
  `working_hours` time NOT NULL,
  `late` int(11) NOT NULL,
  `early_leave` int(11) NOT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance_temp`
--

CREATE TABLE `emp_attendance_temp` (
  `id` int(11) NOT NULL,
  `iMachineNumber` int(11) NOT NULL,
  `finger_id` varchar(45) DEFAULT NULL,
  `attendan_date` date DEFAULT NULL,
  `Punch` time DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `is_reviewed` int(1) NOT NULL COMMENT '0--> not reviewed , 1-->reviwed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_education`
--

CREATE TABLE `emp_education` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `Score` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_language`
--

CREATE TABLE `emp_language` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `Fluency` int(11) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_licence`
--

CREATE TABLE `emp_licence` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `licence_id` int(11) DEFAULT NULL,
  `licensenumber` varchar(45) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_overtime`
--

CREATE TABLE `emp_overtime` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `minutes` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_vacations`
--

CREATE TABLE `emp_vacations` (
  `id` int(11) NOT NULL,
  `Emp_id` int(11) DEFAULT NULL,
  `v_type` int(11) DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `From_balance` tinyint(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_weekends`
--

CREATE TABLE `emp_weekends` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `day_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8,
  `file_path` mediumtext CHARACTER SET utf8,
  `cat_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_status` tinyint(1) DEFAULT NULL,
  `version` decimal(10,2) DEFAULT NULL,
  `upper_file` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `files_cat`
--

CREATE TABLE `files_cat` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forcompanesnce`
--

CREATE TABLE `forcompanesnce` (
  `id` int(11) NOT NULL DEFAULT '0',
  `finger_id` varchar(45) DEFAULT NULL,
  `attendan_date` date DEFAULT NULL,
  `Punch_In` time DEFAULT NULL,
  `in_note` text,
  `Punch_out` time DEFAULT NULL,
  `Out_note` text,
  `add_date` timestamp NULL DEFAULT NULL,
  `add_id` int(11) DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `edit_user` int(11) DEFAULT NULL,
  `working_hours` time NOT NULL,
  `late` int(11) NOT NULL,
  `early_leave` int(11) NOT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

-- --------------------------------------------------------

--
-- Table structure for table `groupshift`
--

CREATE TABLE `groupshift` (
  `id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `Holiday_Name` varchar(45) DEFAULT NULL,
  `Holiday_Date` date DEFAULT NULL,
  `Repeats_annually` int(1) DEFAULT NULL,
  `Day_Type` int(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hrsettings`
--

CREATE TABLE `hrsettings` (
  `id` int(11) NOT NULL,
  `month_start` int(11) NOT NULL,
  `month_end` int(11) NOT NULL,
  `max_early_leave` int(11) NOT NULL,
  `absense_operator` int(11) NOT NULL,
  `max_absense_perm` int(11) NOT NULL,
  `weekend_type` int(11) NOT NULL,
  `no_min_one_punch` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `immigration`
--

CREATE TABLE `immigration` (
  `id` int(11) NOT NULL,
  `Document_type` int(11) DEFAULT NULL,
  `document_number` varchar(45) DEFAULT NULL,
  `emp_id` varchar(45) DEFAULT NULL,
  `issued_date` varchar(45) DEFAULT NULL,
  `expiry_date` varchar(45) DEFAULT NULL,
  `issued_by` varchar(45) DEFAULT NULL,
  `Comments` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_description` text,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_category`
--

CREATE TABLE `job_category` (
  `id` int(11) NOT NULL,
  `job_category` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `languagename` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `late_ranges`
--

CREATE TABLE `late_ranges` (
  `id` int(11) NOT NULL,
  `range_start` int(11) NOT NULL,
  `range_end` int(11) NOT NULL,
  `cut_operator` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `licence`
--

CREATE TABLE `licence` (
  `id` int(11) NOT NULL,
  `licensename` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `address` text,
  `tele` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `milestone_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `project_id`, `milestone_name`, `description`, `start`, `end`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'متجر نوارة الحجاز للتمور', NULL, NULL, NULL, 727, '2021-01-16 19:22:06', '2021-01-16 19:22:06'),
(2, 1, 'طلبات العملاء', NULL, '2021-02-01', '2021-02-07', 727, '2021-01-16 19:26:07', '2021-02-07 21:16:27'),
(3, 1, 'الدعم الفني', NULL, '2021-01-01', '2021-01-31', 727, '2021-01-16 19:54:43', '2021-02-07 21:16:57'),
(4, 2, 'التدريب الفني', NULL, '2021-01-09', '2021-01-31', 727, '2021-01-17 14:12:13', '2021-01-17 14:12:13'),
(5, 2, 'شهر 1', NULL, '2021-01-02', '2021-01-31', 727, '2021-01-17 14:18:36', '2021-01-17 14:18:36'),
(6, 27, 'مراجعه التطبيق', NULL, NULL, NULL, 690, '2021-01-17 14:29:24', '2021-01-17 14:29:24'),
(7, 2, 'عملاء الرياض شهر 12', NULL, NULL, NULL, 727, '2021-01-17 14:45:38', '2021-01-17 14:45:38'),
(8, 16, 'تحسن المرحله الاولى', 'ملاحظات وتحديثات على المرحله الأولى', '2021-01-17', '2021-01-31', 696, '2021-01-17 14:59:27', '2021-01-17 14:59:27'),
(9, 2, 'عملاء الرياض شهر 11', NULL, NULL, NULL, 727, '2021-01-17 15:02:37', '2021-01-17 15:02:37'),
(10, 2, 'تصورات مطلوبة شهر 11', NULL, NULL, NULL, 727, '2021-01-17 15:08:31', '2021-01-17 15:08:31'),
(11, 2, 'مطلوب تحديد وقت و تكلفة', NULL, NULL, NULL, 727, '2021-01-17 15:15:44', '2021-01-17 15:15:44'),
(12, 2, 'General', NULL, NULL, NULL, 727, '2021-01-17 15:26:26', '2021-01-17 15:26:26'),
(13, 4, 'تسجيل الحضور و الانصراف', NULL, NULL, NULL, 727, '2021-01-17 15:34:37', '2021-01-17 15:34:37'),
(14, 9, 'أكنان', NULL, NULL, NULL, 727, '2021-01-17 15:50:32', '2021-01-17 15:50:32'),
(15, 29, 'الربط المحاسبي', NULL, NULL, NULL, 727, '2021-01-17 15:53:36', '2021-01-17 15:53:36'),
(16, 25, 'تطبيق متجر وطن ايفون', NULL, NULL, NULL, 727, '2021-01-17 16:01:41', '2021-01-17 16:01:41'),
(17, 2, 'طلبات عملاء محتملين', NULL, NULL, NULL, 738, '2021-01-17 19:29:41', '2021-01-17 19:29:41'),
(18, 31, 'المرحلة الثانية تطبيق المريض', NULL, NULL, NULL, 727, '2021-01-17 20:13:43', '2021-01-17 20:13:43'),
(19, 31, 'المرحلة الثانية - لوحه التحكم', NULL, NULL, NULL, 727, '2021-01-17 20:14:06', '2021-01-17 20:14:06'),
(20, 9, 'تطبيق نخبة الفنيين', NULL, NULL, NULL, 730, '2021-01-17 20:30:33', '2021-01-17 20:30:33'),
(21, 31, 'المرحلة الثالثة تطبيق الطبيب', NULL, NULL, NULL, 727, '2021-01-18 13:08:39', '2021-01-18 13:08:39'),
(22, 31, 'المرحلة الثالثة تطبيق المريض', NULL, NULL, NULL, 727, '2021-01-18 13:15:52', '2021-01-18 13:15:52'),
(23, 31, 'المرحلة الثالثه - لوحة التحكم', NULL, NULL, NULL, 727, '2021-01-18 13:21:03', '2021-01-18 13:21:03'),
(24, 31, 'تعديلات مطلوبه فى لوحة التحكم لوجود أخطاء', NULL, NULL, NULL, 727, '2021-01-18 13:37:24', '2021-01-18 13:37:24'),
(25, 31, 'المرحلة الرابعة - لوحة التحكم', NULL, NULL, NULL, 727, '2021-01-18 13:42:50', '2021-01-18 13:42:50'),
(26, 24, 'المرحله الاولى من تطبيق الفنيين', NULL, NULL, NULL, 696, '2021-01-18 13:44:32', '2021-01-18 13:44:32'),
(27, 31, 'المرحلة الرابعه - الطبيب', NULL, NULL, NULL, 727, '2021-01-18 13:55:36', '2021-01-18 13:55:36'),
(28, 2, 'تصورات مطلوبة', NULL, NULL, NULL, 727, '2021-01-18 14:42:54', '2021-01-18 14:42:54'),
(29, 35, 'front', NULL, NULL, NULL, 707, '2021-01-18 14:42:56', '2021-01-18 14:42:56'),
(30, 35, 'back', NULL, NULL, NULL, 707, '2021-01-18 14:43:13', '2021-01-18 14:43:13'),
(31, 35, 'MAILSTONE', NULL, NULL, NULL, 707, '2021-01-18 15:47:56', '2021-01-18 15:47:56'),
(32, 31, 'مرحلة الاختبار', NULL, NULL, NULL, 727, '2021-01-18 17:25:30', '2021-01-18 17:25:30'),
(33, 34, 'موقع بيلارز', 'موقع بيلارز', '2021-01-18', '2021-01-19', 732, '2021-01-18 19:07:30', '2021-01-18 19:07:30'),
(34, 1, 'طلبات عملاء فى نسخة الطاولات', NULL, NULL, NULL, 727, '2021-01-19 12:36:26', '2021-01-19 12:36:26'),
(35, 1, 'جدول تطوير فريق العمل', NULL, NULL, NULL, 727, '2021-01-19 12:39:09', '2021-01-19 12:39:09'),
(36, 1, 'تطبيق الاندرويد المزامنه - طلبات تطوير', NULL, NULL, NULL, 727, '2021-01-19 12:45:00', '2021-01-19 12:45:00'),
(37, 1, 'بيت الطبيعة Ios', NULL, NULL, NULL, 727, '2021-01-19 12:47:27', '2021-01-19 12:47:27'),
(38, 1, 'بيت الطبيعة Android', NULL, NULL, NULL, 727, '2021-01-19 12:47:39', '2021-01-19 12:47:39'),
(39, 1, 'تطبيق صولة iOS', NULL, NULL, NULL, 727, '2021-01-19 12:53:31', '2021-01-19 12:53:31'),
(40, 1, 'المرحله الاولى من مطاعم البدر', NULL, NULL, NULL, 727, '2021-01-19 13:14:53', '2021-01-19 13:14:53'),
(41, 1, 'خطط تطوير البدر للمبيعات', NULL, NULL, NULL, 727, '2021-01-19 13:20:01', '2021-01-19 13:20:01'),
(42, 1, 'الجودة و الاختبار', NULL, NULL, NULL, 727, '2021-01-19 14:01:41', '2021-01-19 14:01:41'),
(43, 29, 'تطبيق بي تك المندوب - Android', NULL, NULL, NULL, 727, '2021-01-20 13:39:05', '2021-01-20 13:39:05'),
(44, 36, 'تطبيق الايفون', NULL, NULL, NULL, 737, '2021-01-21 18:42:30', '2021-01-21 18:42:30'),
(45, 36, 'الويب', NULL, NULL, NULL, 737, '2021-01-21 18:44:44', '2021-01-21 18:44:44'),
(46, 24, 'Web', NULL, NULL, NULL, 727, '2021-01-23 13:21:42', '2021-01-23 13:21:42'),
(47, 24, 'iOS application', NULL, NULL, NULL, 727, '2021-01-23 13:22:02', '2021-01-23 13:22:02'),
(48, 24, 'Android Application', NULL, NULL, NULL, 727, '2021-01-23 13:44:29', '2021-01-23 13:44:29'),
(49, 19, 'طلبات عملاء', NULL, NULL, NULL, 727, '2021-01-23 13:53:23', '2021-01-23 13:53:23'),
(50, 19, 'تطوير و تعديل', NULL, NULL, NULL, 727, '2021-01-23 13:53:42', '2021-01-23 13:53:42'),
(51, 8, 'طلبات عملاء', NULL, NULL, NULL, 727, '2021-01-23 13:58:08', '2021-01-23 13:58:08'),
(52, 1, 'تطوير و تعديل', NULL, NULL, NULL, 727, '2021-01-23 13:58:29', '2021-01-23 13:58:29'),
(53, 8, 'تطوير و تعديل', NULL, NULL, NULL, 727, '2021-01-23 13:59:18', '2021-01-23 13:59:18'),
(54, 8, 'حاويات السودان', NULL, NULL, NULL, 727, '2021-01-23 14:07:25', '2021-01-23 14:07:25'),
(55, 22, 'التطبيق', NULL, NULL, NULL, 727, '2021-01-23 14:34:07', '2021-01-23 14:34:07'),
(56, 21, 'دراسة تعديلات علي المشاريع', NULL, NULL, NULL, 727, '2021-01-23 14:37:24', '2021-01-23 14:37:24'),
(57, 21, 'دراسة وتقييم مشاريع جديدة', NULL, NULL, NULL, 727, '2021-01-23 14:37:42', '2021-01-23 14:37:42'),
(58, 18, 'مرحلة الاختبار', NULL, NULL, NULL, 727, '2021-01-23 14:42:14', '2021-01-23 14:42:14'),
(59, 26, 'Android Application', NULL, NULL, NULL, 727, '2021-01-23 15:08:43', '2021-01-23 15:08:43'),
(60, 29, 'iOS Application', NULL, NULL, NULL, 727, '2021-01-23 15:31:52', '2021-01-23 15:31:52'),
(61, 10, 'طلبات الخدمات المنزليه', NULL, NULL, NULL, 727, '2021-01-23 15:40:07', '2021-01-23 15:40:07'),
(62, 10, 'تطبيق iOS', NULL, NULL, NULL, 727, '2021-01-23 15:41:59', '2021-01-23 15:41:59'),
(63, 23, 'تطبيق iOS', NULL, NULL, NULL, 727, '2021-01-23 15:47:05', '2021-01-23 15:47:05'),
(64, 30, 'Test المتجر', NULL, NULL, NULL, 727, '2021-01-23 15:50:53', '2021-01-24 13:55:39'),
(65, 34, 'سوق السلطان', NULL, NULL, NULL, 727, '2021-01-23 15:56:39', '2021-01-23 15:56:39'),
(66, 34, 'قطرة الماء', NULL, NULL, NULL, 727, '2021-01-23 15:59:10', '2021-01-23 15:59:10'),
(67, 29, 'API', NULL, NULL, NULL, 727, '2021-01-23 17:13:41', '2021-01-23 17:13:41'),
(68, 34, 'watch to buy', NULL, NULL, NULL, 727, '2021-01-23 18:04:23', '2021-01-23 18:04:23'),
(69, 34, 'حاويات السودان', NULL, NULL, NULL, 727, '2021-01-23 18:06:49', '2021-01-23 18:06:49'),
(70, 34, 'مشروع زينة', NULL, NULL, NULL, 727, '2021-01-23 18:15:42', '2021-01-23 18:15:42'),
(71, 34, 'السكب', NULL, NULL, NULL, 727, '2021-01-23 18:20:15', '2021-01-23 18:20:15'),
(72, 34, 'موقع نيت استيشن', NULL, NULL, NULL, 727, '2021-01-23 18:24:33', '2021-01-23 18:24:33'),
(73, 34, 'صالون تك', NULL, NULL, NULL, 727, '2021-01-23 18:26:40', '2021-01-23 18:26:40'),
(74, 34, 'ميديكا زون', NULL, NULL, NULL, 727, '2021-01-23 18:28:27', '2021-01-23 18:28:27'),
(75, 34, 'المدينه الرقمية لكبار السن', NULL, NULL, NULL, 727, '2021-01-23 18:34:31', '2021-01-23 18:34:31'),
(76, 26, 'إختبار التطبيق', NULL, NULL, NULL, 727, '2021-01-23 18:37:32', '2021-01-23 18:37:32'),
(77, 34, 'الحاويات تطوير', NULL, NULL, NULL, 727, '2021-01-23 19:01:06', '2021-01-23 19:01:06'),
(78, 34, 'الموارد البشرية', NULL, NULL, NULL, 727, '2021-01-23 19:02:30', '2021-01-23 19:02:30'),
(79, 37, 'الإختبار', NULL, NULL, NULL, 727, '2021-01-23 19:47:03', '2021-01-23 19:47:03'),
(80, 38, 'مرحلة الاختبار', NULL, NULL, NULL, 727, '2021-01-23 19:48:29', '2021-01-23 19:48:29'),
(81, 29, 'تعديلات', NULL, NULL, NULL, 727, '2021-01-24 15:02:05', '2021-01-24 15:02:05'),
(82, 29, 'طلبات عملاء', NULL, NULL, NULL, 727, '2021-01-24 15:05:38', '2021-01-24 15:05:38'),
(83, 34, 'حراج واحد', NULL, NULL, NULL, 727, '2021-01-24 17:39:35', '2021-01-24 17:39:35'),
(84, 33, 'مرحلة الاختبار', NULL, NULL, NULL, 727, '2021-01-24 17:42:54', '2021-01-24 17:42:54'),
(85, 34, 'طلبات عملاء', 'لتسجيل طلبات العملاء القديمه والصغيره', '2021-01-01', '2021-01-24', 696, '2021-01-24 18:31:04', '2021-01-24 18:31:04'),
(86, 39, 'ui message viewcontoroller', NULL, NULL, NULL, 701, '2021-01-25 15:47:24', '2021-01-25 15:47:24'),
(87, 40, 'مرحله التصميم', 'تصميمات المشروع ووضع خطه العمل', '2021-01-25', '2021-01-27', 696, '2021-01-25 20:29:14', '2021-01-25 20:29:14'),
(88, 26, 'تغير  الوان التطبيق', NULL, '2021-01-26', '2021-01-26', 701, '2021-01-26 16:38:19', '2021-01-26 16:38:19'),
(89, 15, 'Android Application', NULL, NULL, NULL, 690, '2021-01-26 17:32:19', '2021-01-26 17:32:19'),
(90, 16, 'المرحلة الثانية - تسحين جدوله المهام', 'تحسن عمل الجدوله للمشاريع و تنظيم مواعيد العمل والاجازات', '2021-02-07', '2021-02-11', 696, '2021-01-27 14:29:59', '2021-01-27 14:29:59'),
(91, 15, 'IOS Application', NULL, NULL, NULL, 693, '2021-01-27 15:08:29', '2021-01-27 15:08:29'),
(92, 4, 'الأعمال الإدارية', NULL, '2021-01-01', '2021-01-31', 696, '2021-01-27 16:44:54', '2021-01-27 16:44:54'),
(93, 34, 'البنا ستور', NULL, NULL, NULL, 737, '2021-01-27 17:12:28', '2021-01-27 17:12:28'),
(94, 41, 'تغير الالوان', NULL, NULL, NULL, 701, '2021-01-27 17:12:58', '2021-01-27 17:12:58'),
(95, 2, 'خطه عمل تدريب من اجل التوظيف بالسعودية', 'وضع مراحل التنفيذ وخطه العمل', '2021-01-28', '2021-02-28', 696, '2021-01-28 20:00:48', '2021-01-28 20:00:48'),
(96, 11, 'ملاحظات ال test', NULL, NULL, NULL, 701, '2021-01-31 19:23:22', '2021-01-31 19:23:22'),
(97, 42, 'مرحلة التست', NULL, NULL, NULL, 737, '2021-02-03 20:49:19', '2021-02-03 20:49:19'),
(98, 2, 'شهر 2', NULL, NULL, NULL, 729, '2021-02-06 15:00:50', '2021-02-06 15:00:50'),
(99, 1, 'تطوير المتاجر', NULL, NULL, NULL, 737, '2021-02-07 21:44:50', '2021-02-07 21:44:50'),
(100, 6, 'تعديلات', NULL, NULL, NULL, 729, '2021-02-09 15:50:15', '2021-02-09 15:50:15'),
(101, 34, 'Android Application', NULL, NULL, NULL, 690, '2021-02-09 15:59:38', '2021-02-09 15:59:38'),
(102, 34, 'Net station', NULL, NULL, NULL, 690, '2021-02-09 16:00:13', '2021-02-09 16:00:13'),
(103, 34, '( مابي ( ايفينت', NULL, NULL, NULL, 698, '2021-02-09 17:11:00', '2021-02-09 17:11:00'),
(104, 43, 'تطوير', NULL, NULL, NULL, 687, '2021-02-10 14:16:34', '2021-02-10 14:16:34'),
(105, 26, 'IOS Application', NULL, NULL, NULL, 701, '2021-02-10 16:53:14', '2021-02-10 16:53:14'),
(106, 26, 'مشاكل api', NULL, NULL, NULL, 698, '2021-02-11 17:02:28', '2021-02-11 17:02:28'),
(107, 44, 'طلبات تطوير', 'طلبات تطوير', '2021-02-01', '2021-02-28', 696, '2021-02-11 19:23:29', '2021-02-11 19:23:29'),
(108, 44, 'مشاكل الموقع', 'لمشكلات الموقع والتطبيق', NULL, NULL, 696, '2021-02-11 19:23:49', '2021-02-11 19:23:49'),
(109, 45, 'مرحلة التصميم', NULL, NULL, NULL, 688, '2021-02-11 21:00:07', '2021-02-11 21:00:07'),
(110, 9, 'لحمتك لبيتك', NULL, NULL, NULL, 737, '2021-02-14 16:11:10', '2021-02-14 16:11:10'),
(111, 40, 'front', NULL, NULL, NULL, 707, '2021-02-15 15:26:35', '2021-02-15 15:26:35'),
(112, 46, 'التصميمات', 'مرحله تصميمات الشاشات', '2021-02-15', '2021-02-21', 696, '2021-02-16 01:16:00', '2021-02-16 01:16:00'),
(113, 46, 'مرحلة  برمجه الشاشات', NULL, '2021-02-22', '2021-03-04', 696, '2021-02-16 01:16:41', '2021-02-16 01:16:41'),
(114, 47, 'مراجعه التصميمات وملفات العمل', 'مراجعه التصميمات وملفات العمل', '2021-02-16', '2021-02-18', 696, '2021-02-16 14:51:36', '2021-02-16 14:51:36'),
(115, 48, 'ملاحظات العميل', 'ملاحظات العميل', '2021-02-16', '2021-02-16', 696, '2021-02-16 17:49:29', '2021-02-16 17:49:29'),
(116, 3, 'الاستضافات والدومينات', NULL, '2021-02-01', '2020-12-31', 699, '2021-02-16 18:11:14', '2021-02-16 18:11:14'),
(117, 49, 'تطبيقات الطرف', NULL, NULL, NULL, 730, '2021-02-17 15:15:00', '2021-02-17 15:15:00'),
(118, 29, 'دعم فني', NULL, NULL, NULL, 737, '2021-02-17 20:00:08', '2021-02-17 20:00:08'),
(119, 50, 'ScreenShots', NULL, NULL, NULL, 701, '2021-02-22 16:06:55', '2021-02-22 16:06:55'),
(120, 2, 'شهر 3', NULL, '2021-03-01', '2021-03-31', 738, '2021-03-01 15:30:14', '2021-03-01 15:30:14'),
(121, 52, 'مرحلة التصميم', 'تصميم التطبيقات', '2021-03-01', '2021-03-10', 696, '2021-03-01 18:11:33', '2021-03-01 18:11:33'),
(122, 46, 'مرحلة التطوير', NULL, NULL, NULL, 737, '2021-03-01 22:57:34', '2021-03-01 22:57:34'),
(123, 46, 'مرحلة التطوير', NULL, NULL, NULL, 737, '2021-03-01 22:58:22', '2021-03-01 22:58:22'),
(124, 10, 'مشروع مغاسل أكنان', 'تسليم العميل تطبيقاته نهائيا', '2021-03-01', '2021-03-10', 735, '2021-03-02 17:39:49', '2021-03-02 17:39:49'),
(125, 34, 'بيت السبح', NULL, NULL, NULL, 737, '2021-03-02 21:11:28', '2021-03-02 21:11:28'),
(126, 53, 'اعلن', NULL, NULL, NULL, 730, '2021-03-04 16:26:10', '2021-03-04 16:26:10'),
(127, 1, 'نت ستيشن IOS', 'متجر نت ستيشن IOS', NULL, NULL, 693, '2021-03-04 16:41:23', '2021-03-04 16:41:23'),
(128, 52, 'اعداد واختبار', NULL, NULL, NULL, 739, '2021-03-07 16:53:33', '2021-03-07 16:53:33'),
(129, 54, 'مهام إدارية', NULL, NULL, NULL, 696, '2021-03-09 12:51:39', '2021-03-09 12:51:39'),
(130, 53, 'اعلن', NULL, NULL, NULL, 730, '2021-03-09 19:09:04', '2021-03-09 19:09:04'),
(131, 1, 'اختبار البدر نسخة 37', NULL, NULL, NULL, 735, '2021-03-09 19:14:50', '2021-03-09 19:14:50'),
(132, 40, 'dashboard front', NULL, NULL, NULL, 707, '2021-03-17 14:49:41', '2021-03-17 14:49:41'),
(133, 47, 'تطبيق الاندرويد', NULL, NULL, NULL, 690, '2021-03-21 14:15:36', '2021-03-21 14:15:36'),
(134, 1, 'طلبات الاستبيانات', NULL, NULL, NULL, 737, '2021-03-29 16:34:59', '2021-03-29 16:34:59'),
(135, 40, 'الموقع باك اند', NULL, NULL, NULL, 737, '2021-03-30 16:34:30', '2021-03-30 16:34:30'),
(136, 2, 'شهر 4', NULL, NULL, NULL, 729, '2021-04-03 13:52:43', '2021-04-03 13:52:43'),
(137, 55, 'تطبيق الايقون', NULL, NULL, NULL, 736, '2021-04-11 15:45:13', '2021-04-11 15:45:13'),
(138, 40, 'اختبار', NULL, NULL, NULL, 739, '2021-04-11 20:02:40', '2021-04-11 20:02:40'),
(139, 52, 'تطبيق الأندرويد', NULL, NULL, NULL, 737, '2021-04-12 20:59:42', '2021-04-12 20:59:42'),
(140, 47, 'تطبيق الايفون', NULL, NULL, NULL, 737, '2021-04-13 15:39:18', '2021-04-13 15:39:18'),
(141, 47, 'لوحة التحكم', NULL, NULL, NULL, 737, '2021-04-13 15:39:57', '2021-04-13 15:39:57'),
(142, 40, 'لوحة التحكم  - باك اند', NULL, NULL, NULL, 737, '2021-04-13 16:09:14', '2021-04-13 16:09:14'),
(143, 56, 'تحليل المشروع', NULL, NULL, NULL, 739, '2021-04-20 18:05:12', '2021-04-20 18:05:12'),
(144, 47, 'اختبار', NULL, NULL, NULL, 739, '2021-04-28 17:40:46', '2021-04-28 17:40:46'),
(145, 57, 'مرحلة التصميم', 'تصميمات التطبيقات', '2021-04-28', '2021-05-06', 696, '2021-04-29 21:39:00', '2021-04-29 21:39:00'),
(146, 57, 'تطبيق الاندوريد مشروع متكامل', 'برمجه الاندوريد لمشروع متكامل', '2021-05-13', '2021-06-20', 696, '2021-05-01 15:39:34', '2021-05-01 15:39:34'),
(147, 57, 'تطبيق الايفون مشروع متكامل', 'برمجه الايفون لمشروع متكامل', '2021-06-20', '2021-08-01', 696, '2021-05-01 15:40:19', '2021-05-01 15:40:19'),
(148, 64, 'اختبار', NULL, NULL, NULL, 739, '2021-06-15 21:24:06', '2021-06-15 21:24:06'),
(149, 52, 'IOS', NULL, NULL, NULL, 701, '2021-06-23 13:30:31', '2021-06-23 13:30:31'),
(150, 64, 'Sprint 1 - Guest Features', NULL, NULL, '2021-07-28', 737, '2021-07-26 15:47:01', '2021-07-26 15:47:01'),
(151, 64, 'Sprint 2 - User Features', NULL, '2021-07-28', NULL, 737, '2021-07-26 15:47:26', '2021-07-26 15:47:26'),
(152, 64, 'اختبار', NULL, NULL, NULL, 739, '2021-08-03 16:34:32', '2021-08-03 16:34:32'),
(153, 65, 'موقع المدينة الرقمية', NULL, NULL, NULL, 732, '2021-08-05 15:37:20', '2021-08-05 15:37:20'),
(154, 56, 'SP1 - Auth + Chat', NULL, NULL, NULL, 737, '2021-08-16 20:02:24', '2021-08-16 20:02:24'),
(155, 29, 'اي فواتيركم', NULL, NULL, NULL, 737, '2021-09-01 20:49:11', '2021-09-01 20:49:11'),
(156, 2, 'Savannah Valencia', 'Distinctio Autemش es', '2021-09-14', '2021-09-14', 741, '2021-09-14 18:59:21', '2021-09-14 18:59:21'),
(157, 1, 'سوق البدر', 'مشروع سوق البدر', NULL, NULL, 693, '2021-09-23 19:34:01', '2021-09-23 19:34:01'),
(158, 1, 'سوق البدر ios', 'سوق البدر ios', NULL, NULL, 693, '2021-09-23 19:35:04', '2021-09-23 19:35:04'),
(159, 1, 'تطبيق المندوبين', NULL, NULL, NULL, 737, '2021-09-26 21:25:51', '2021-09-26 21:25:51'),
(160, 42, 'Android SP1', NULL, NULL, NULL, 737, '2021-09-28 16:25:32', '2021-09-28 16:25:32'),
(161, 42, 'Android SP2', NULL, NULL, NULL, 737, '2021-09-28 16:25:45', '2021-09-28 16:25:45'),
(162, 42, 'Android SP3', NULL, NULL, NULL, 737, '2021-09-28 16:25:54', '2021-09-28 16:25:54'),
(163, 41, 'payticc_ios', NULL, NULL, NULL, 701, '2021-09-29 15:21:54', '2021-09-29 15:21:54'),
(164, 66, 'تعديلات', NULL, NULL, NULL, 707, '2021-10-14 17:55:28', '2021-10-14 17:55:28'),
(165, 67, 'طلبات العميل', NULL, NULL, NULL, 691, '2021-10-17 14:18:31', '2021-10-17 14:18:31'),
(166, 1, 'اختبار نسخه اوف لاين', NULL, NULL, NULL, 739, '2021-10-18 16:29:55', '2021-10-18 16:29:55'),
(167, 69, 'restore', NULL, NULL, NULL, 739, '2021-10-25 16:15:06', '2021-10-25 16:15:06'),
(168, 69, 'لوحه التحكم', NULL, NULL, NULL, 739, '2021-11-04 19:19:33', '2021-11-04 19:19:33'),
(169, 70, 'التعاقد', NULL, NULL, NULL, 739, '2021-11-07 21:24:04', '2021-11-07 21:24:04'),
(170, 71, 'firefighting', NULL, NULL, NULL, 730, '2021-11-22 21:50:20', '2021-11-22 21:50:20'),
(171, 72, 'client App', 'It contains a description of the characteristics of the client\'s application and its mechanism of action', NULL, NULL, 730, '2021-11-24 04:03:24', '2021-11-24 04:03:24'),
(172, 72, 'provider App', 'It contains a description of the characteristics of the provider\'s application and its mechanism of action', NULL, NULL, 730, '2021-11-24 04:04:13', '2021-11-24 04:04:13'),
(173, 72, 'admin Web', 'It contains a description of the characteristics of the admin controlling the control panel and applications as a whole, displaying any content and adding, modifying or deleting any data', NULL, NULL, 730, '2021-11-24 04:06:28', '2021-11-24 04:06:28'),
(174, 69, 'التطبيق', NULL, NULL, NULL, 736, '2021-12-07 17:37:17', '2021-12-07 17:37:17'),
(175, 1, 'اختبار البدر', NULL, NULL, NULL, 748, '2021-12-23 16:25:33', '2021-12-23 16:25:33'),
(176, 8, 'اختبار الحاويات', NULL, NULL, NULL, 736, '2021-12-30 16:19:44', '2021-12-30 16:19:44'),
(177, 72, 'test', NULL, NULL, NULL, 739, '2022-01-09 22:18:14', '2022-01-09 22:18:14'),
(178, 3, 'حسابات عامه', 'حسابات عامه', '2022-02-06', '2024-03-01', 699, '2022-02-07 01:12:23', '2022-02-07 01:12:23'),
(179, 1, 'مندوبين', NULL, NULL, NULL, 747, '2022-03-15 18:23:34', '2022-03-15 18:23:34'),
(180, 75, 'خطة اختبار المتجر', NULL, NULL, NULL, 736, '2022-04-24 19:20:04', '2022-04-24 19:20:04'),
(181, 78, 'Marah Cannon', 'Dolor ullam aliqua', NULL, NULL, 736, '2022-05-15 15:27:38', '2022-05-15 15:27:38'),
(182, 77, 'Sloane Mooney', 'Maxime duis pariatur', NULL, NULL, 736, '2022-05-15 15:27:43', '2022-05-15 15:27:43'),
(183, 79, 'تطبيق الاندرويد', NULL, NULL, NULL, 739, '2022-05-16 15:56:41', '2022-05-16 15:56:41'),
(184, 52, 'المرحلة الثالثة', NULL, '2022-05-16', '2022-06-16', 739, '2022-05-16 16:51:12', '2022-05-16 16:51:12'),
(185, 29, 'taag pay', 'موقع تاق باي', '2022-05-01', '2023-05-01', 687, '2022-05-30 19:22:34', '2022-05-30 19:22:34'),
(186, 16, 'المرحله التالته', NULL, '2022-06-01', '2022-06-30', 741, '2022-06-01 16:12:24', '2022-06-01 16:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notify_approve`
--

CREATE TABLE `notify_approve` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `access` tinyint(1) DEFAULT NULL,
  `edit` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notify_list`
--

CREATE TABLE `notify_list` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'api',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `routes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`, `routes`, `list_group`) VALUES
(1, 'add_task', 'add task', 'api', '2022-04-06 17:58:20', '2022-05-26 09:17:16', NULL, 'employee_projects'),
(2, 'view_projects', 'view projects', 'api', '2022-04-06 17:58:32', '2022-04-06 17:58:32', NULL, 'general'),
(3, 'add_project', 'add project', 'api', '2022-04-06 17:58:38', '2022-04-06 17:58:38', NULL, 'general'),
(4, 'view_project_Report', 'view project Report', 'api', '2022-04-06 17:58:47', '2022-04-06 17:58:47', NULL, 'general'),
(5, 'view_all_tasks', 'view all tasks', 'api', '2022-04-06 17:58:57', '2022-04-06 17:58:57', NULL, 'general'),
(6, 'view_followed_task', 'view followed task', 'api', '2022-04-06 17:59:19', '2022-04-06 17:59:19', NULL, 'general'),
(7, 'view_My_tasks', 'view My tasks', 'api', '2022-04-06 17:59:30', '2022-04-06 17:59:30', NULL, 'general'),
(8, 'recive_notification', 'recive notification', 'api', '2022-04-06 17:59:38', '2022-04-06 17:59:38', NULL, 'general'),
(9, 'view_employees', 'view employees', 'api', '2022-04-06 17:59:45', '2022-04-06 17:59:45', NULL, 'general'),
(10, 'add_employee', 'add employee', 'api', '2022-04-06 17:59:53', '2022-04-06 17:59:53', NULL, 'general'),
(11, 'view_employees_Reports', 'view employees Reports', 'api', '2022-04-06 18:00:01', '2022-04-06 18:00:01', NULL, 'general'),
(12, 'view_org_wiki', 'view org wiki', 'api', '2022-04-06 18:00:14', '2022-04-06 18:00:14', NULL, 'general'),
(13, 'view_project_wiki', 'view project wiki', 'api', '2022-04-06 18:00:22', '2022-04-06 18:00:22', NULL, 'general'),
(14, 'add_wiki', 'add wiki', 'api', '2022-04-06 18:00:27', '2022-04-06 18:00:27', NULL, 'general'),
(15, 'add_task_status', 'add task status', 'api', '2022-04-06 18:00:40', '2022-04-06 18:00:40', NULL, 'general'),
(16, 'add_backlogs_status', 'add backlogs status', 'api', '2022-04-06 18:00:48', '2022-04-06 18:00:48', NULL, 'general'),
(17, 'add_backlogs_points', 'add backlogs points', 'api', '2022-04-06 18:00:59', '2022-04-06 18:00:59', NULL, 'general'),
(18, 'add_backlogs_priorities', 'add backlogs priorities', 'api', '2022-04-06 18:01:20', '2022-04-06 18:01:20', NULL, 'general'),
(19, 'add_permission', 'add permission', 'api', '2022-04-06 18:01:32', '2022-04-06 18:01:32', NULL, 'general'),
(20, 'add_wiki_cateogries', 'add wiki cateogries', 'api', '2022-04-06 18:01:40', '2022-04-06 18:01:40', NULL, 'general'),
(22, 'view_reviwer_tasks', 'view_reviwer_tasks', 'api', '2022-05-17 09:30:49', '2022-05-17 09:30:49', NULL, 'general'),
(23, 'view_wiki_cateogries', 'view wiki cateogries', 'api', '2022-05-18 07:03:31', '2022-05-18 07:03:31', NULL, 'general'),
(24, 'view_task_status', 'view task status', 'api', '2022-05-18 07:13:48', '2022-05-18 07:13:48', NULL, 'general'),
(25, 'view_backlogs_status', 'view backlogs status', 'api', '2022-05-18 07:17:37', '2022-05-18 07:17:37', NULL, 'general'),
(26, 'view_backlogs_points', 'view backlogs points', 'api', '2022-05-18 07:19:11', '2022-05-18 07:19:11', NULL, 'general'),
(27, 'view_backlogs_priorities', 'view backlogs priorities', 'api', '2022-05-18 07:22:05', '2022-05-18 07:22:05', NULL, 'general'),
(28, 'view_permission', 'view permission', 'api', '2022-05-18 07:25:07', '2022-05-18 07:25:07', NULL, 'general'),
(29, 'project_milestone', 'project milestone', 'api', '2022-05-22 08:49:27', '2022-05-22 08:49:27', NULL, 'employee_projects'),
(30, 'show_project_testcase', 'show project testcase', 'api', '2022-05-22 09:28:25', '2022-05-22 09:28:25', NULL, 'employee_projects'),
(31, 'show_project_wiki', 'show project wiki', 'api', '2022-05-22 09:28:39', '2022-05-22 09:28:39', NULL, 'employee_projects'),
(32, 'show_project_backlog', 'show project backlog', 'api', '2022-05-22 09:28:51', '2022-05-22 09:28:51', NULL, 'employee_projects'),
(33, 'show_add_employee', 'show add employee', 'api', '2022-05-22 09:29:05', '2022-05-22 09:29:05', NULL, 'employee_projects'),
(34, 'show_add_permission', 'show add permission', 'api', '2022-05-22 09:29:18', '2022-05-22 09:29:18', NULL, 'employee_projects'),
(35, 'show_edit_project', 'show edit project', 'api', '2022-05-22 09:30:51', '2022-05-22 09:30:51', NULL, 'employee_projects'),
(36, 'show_delete_project', 'show delete project', 'api', '2022-05-22 09:31:19', '2022-05-22 09:31:48', NULL, 'employee_projects'),
(42, 'add_any_task', 'add_any_task', 'api', '2022-05-26 05:53:52', '2022-05-26 05:53:52', NULL, 'general'),
(43, 'show_project_details', 'show project details', 'api', '2022-05-29 05:26:15', '2022-05-29 05:26:15', NULL, 'employee_projects'),
(44, 'add_milestone', 'add milestone', 'api', '2022-05-29 05:28:14', '2022-05-29 05:28:14', NULL, 'employee_projects'),
(45, 'milestone_tasks', 'milestone tasks', 'api', '2022-05-29 05:28:41', '2022-05-29 05:28:41', NULL, 'employee_projects'),
(46, 'edit_milestone', 'edit milestone', 'api', '2022-05-29 05:30:21', '2022-05-29 05:30:21', NULL, 'employee_projects'),
(47, 'task_details', 'task details', 'api', '2022-05-29 05:35:38', '2022-05-29 05:35:38', NULL, 'employee_projects'),
(48, 'edit_task', 'edit task', 'api', '2022-05-29 05:35:59', '2022-05-29 05:35:59', NULL, 'employee_projects'),
(49, 'chang_task_employee', 'chang task employee', 'api', '2022-05-29 05:51:09', '2022-05-29 05:51:09', NULL, 'employee_projects'),
(50, 'chang_reviewer_status', 'chang reviewer status', 'api', '2022-05-29 05:52:09', '2022-05-29 05:52:09', NULL, 'employee_projects'),
(51, 'chang_task_status', 'chang task status', 'api', '2022-05-29 05:52:44', '2022-05-29 05:52:44', NULL, 'employee_projects'),
(52, 'add_comment', 'add comment', 'api', '2022-05-29 05:53:48', '2022-05-29 05:53:48', NULL, 'employee_projects'),
(53, 'delete_file', 'delete file', 'api', '2022-05-29 05:54:35', '2022-05-29 05:54:35', NULL, 'employee_projects'),
(54, 'show_subtasks', 'show subtasks', 'api', '2022-05-29 05:55:06', '2022-05-29 05:55:06', NULL, 'employee_projects'),
(55, 'add_subtask', 'add subtask', 'api', '2022-05-29 05:55:34', '2022-05-29 05:55:34', NULL, 'employee_projects'),
(58, 'add_testcases', 'add testcases', 'api', '2022-05-29 07:34:14', '2022-05-29 07:34:14', NULL, 'employee_projects'),
(59, 'testcase_details', 'testcase details', 'api', '2022-05-29 07:51:48', '2022-05-29 07:51:48', NULL, 'employee_projects'),
(60, 'show_testcase_run', 'show testcase run', 'api', '2022-05-29 07:52:39', '2022-05-29 07:52:39', NULL, 'employee_projects'),
(61, 'edit_testcases', 'edit testcases', 'api', '2022-05-29 07:53:09', '2022-05-29 07:53:09', NULL, 'employee_projects'),
(62, 'delete_testcases', 'delete testcases', 'api', '2022-05-29 07:53:20', '2022-05-29 07:53:20', NULL, 'employee_projects'),
(63, 'show_allRuns', 'show allRuns', 'api', '2022-05-29 07:53:53', '2022-05-29 07:53:53', NULL, 'employee_projects'),
(64, 'run_details', 'run details', 'api', '2022-05-29 07:54:39', '2022-05-29 07:54:39', NULL, 'employee_projects'),
(65, 'debug_details', 'debug details', 'api', '2022-05-29 07:54:55', '2022-05-29 07:54:55', NULL, 'employee_projects'),
(66, 'wiki_details', 'wiki details', 'api', '2022-05-29 09:20:47', '2022-05-29 09:20:47', NULL, 'employee_projects'),
(67, 'edit_wiki', 'edit wiki', 'api', '2022-05-29 09:23:25', '2022-05-29 09:23:25', NULL, 'employee_projects'),
(68, 'add_backlog', 'add backlog', 'api', '2022-05-29 09:34:16', '2022-05-29 09:34:16', NULL, 'employee_projects'),
(69, 'add_backlog_as_task', 'add backlog as task', 'api', '2022-05-29 09:38:04', '2022-05-29 09:38:04', NULL, 'employee_projects'),
(70, 'edit_backlog', 'edit backlog', 'api', '2022-05-29 09:39:10', '2022-05-29 09:39:10', NULL, 'employee_projects'),
(71, 'add_project_wiki', 'add project wiki', 'api', '2022-06-01 16:27:45', '2022-06-01 16:27:45', NULL, 'employee_projects');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_ids`
--

CREATE TABLE `player_ids` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_ids`
--

INSERT INTO `player_ids` (`id`, `employee_id`, `player_id`, `created_at`, `updated_at`) VALUES
(378, 730, 'fdrhdRn0EP3F8Yi_VZEIUk:APA91bGzBUPc6IvQMKJ8fBNUGEgKGkuRt7G3jogbLCj-V9O5IPeU5DTimvXCv4mH_3yvH8R-h1tlhvNaEyfzi8wQ9gBcIrOZMnp2s_21RmifuzIpKG5eDuVa8n4bHBCJKJi8WgBfweIZ', '2022-06-01 15:59:27', '2022-06-01 15:59:27'),
(379, 741, 'cb5GwKeH1_eRHDwqQ9Mf9S:APA91bGwalH52qkcHK8R-Jpi_mAEtigYpUzYMyg8-bYqE0gw503v7u50PRTofBhTga3Bf4RJXUdglfyDR0aaiwL0qRGVuwLJIs0aYXTPqrMbk_CpLw6ep6rC8LGO6DAhYWmQRd8eJ-82', '2022-06-01 15:59:39', '2022-06-02 15:52:25'),
(380, 691, 'djV5OvXbcgx69mxaf_346a:APA91bGxHYWNrPh0iw0ZnVhQB1u-2LPUa5H_TB-Ff3EbFn1ZCIjiJ6wOtTcgVbe3JEy06TPTghOWBUjZ2Ebh6O89satAWmAQqswmCDmzgQysTJmz00RWYn54YyyqtjgWMcyEzz5G1g2U', '2022-06-01 15:59:47', '2022-06-01 15:59:47'),
(381, 754, 'euhgIDUQt3m2P2GGdj9kN5:APA91bE0h_SpEZPZTkAm3hivWKVnL2cJAvAHZcYhgdpxuh7l1cyXaLlMxTn7o9pMfHwvd6y_rZD9n1GQ2RLsaLEujR-OrUiOtq9P3x4TvZni02GB3iq6CmXgcNUcRa2o4EVpOnwCdToA', '2022-06-01 16:09:29', '2022-06-01 16:09:29'),
(382, 698, 'ePxR3KOzqTVMOPWDsxTv89:APA91bEZ9Pt15-hb7M1uImmc_8gzjmf271YI5nFEsnsEeUeR1Tj5em24sbSXDpv-g8T4PzZBxX1CwLrVpz9mz6VLgBolLvOHmSwijHUuq-1b_sDe3NzNrxwKAwAxaW2REthKPRR2c-KD', '2022-06-01 16:14:33', '2022-06-01 16:14:33'),
(383, 698, 'ePxR3KOzqTVMOPWDsxTv89:APA91bEoA2s74kuVmMqcQC77wW4kFeltyktALxrqmo_2sh2LL50GxQlp4RSxZH_xOYR9OdTmomJbITNTEnhxjAx1_ioy9mJrrTn0XhcMzPpvwIaZdsQJPYwGpEAajumUWORqTBHQF_Sv', '2022-06-01 16:14:37', '2022-06-01 16:14:37'),
(384, 744, 'f7uvUYIiYijhNcD6c-Yyn9:APA91bG_r-CZPK95p0znEcuW0-bk1D6Y29uy0YJUmwh52d8yjkRZtOrKaABmjUPnreryAP0_f2qgNuIjzxN6bSwK9BbWjIbzcxb6Os1MPZZNYEQkuaw7XOh7O-yuCYXJHlK3uNK9fpH-', '2022-06-01 16:18:34', '2022-06-01 16:18:34'),
(385, 739, 'fiDlf1HZaF92o5BuqqUnYZ:APA91bFq5zy6cr7gxUr0RK1ogC0WJKxYS_gbkOoiKlmyQQLRsGzrCvESrb7uxjXEz7AqpPD0ZfEJyzpwHgHCCWShIT0y0BSrCBxvj2dCfmGqc_-0FywRwg4xbStPYTR3ny2VhtK7Ljdc', '2022-06-01 16:21:23', '2022-06-01 16:21:23'),
(386, 736, 'fOtEOLb8QFlcd6F-M57zlm:APA91bE34qj3_ZK8VhbapAtjVMC9YI2vZfaONX3dh75a04Y4tkZSykITmesHWl_i2T5saGdVgbSMkPik5yHM6t70jWL0bMOIExyK8YlISrSxkI9aF7mkOd1WeJj7eMd1ZaTFN2DqQBdX', '2022-06-01 16:22:01', '2022-06-01 16:22:01'),
(387, 743, 'cwXuJHoDzqmbKhQOaocwOp:APA91bGM5T_Y4u4iAJ_iVCvQSJaLOfmNq2vjffhkv0ehUF92iZkvvnUBo3C9RtTLTE7OxiFIBxjObGQLk1YU2kmEbIWpVmMBO-tGiSvC5yI8sVNPCyh0NqyGQzBzQ67h3g-LlPRROvYg', '2022-06-01 16:40:01', '2022-06-02 14:22:37'),
(388, 743, 'cwXuJHoDzqmbKhQOaocwOp:APA91bGM5T_Y4u4iAJ_iVCvQSJaLOfmNq2vjffhkv0ehUF92iZkvvnUBo3C9RtTLTE7OxiFIBxjObGQLk1YU2kmEbIWpVmMBO-tGiSvC5yI8sVNPCyh0NqyGQzBzQ67h3g-LlPRROvYg', '2022-06-01 16:40:01', '2022-06-01 16:40:01'),
(389, 687, 'fR08JuJsjAZi0tOvSuqH_5:APA91bHrT2QoH5C7inpxZUAWNZEXBewQEtpGKWCQFo-VSiFW2m4UD8C7-gz_AFZ5pNjTWC8i9ouQEssNKyAH5GR6D3K1HVWttDMM9e6YtwX_-WHJnk8LljQyv_mDXGnZcZh11eyuDL7A', '2022-06-01 16:42:04', '2022-06-01 16:42:04'),
(390, 700, 'ebpcuXXR0Lh6Tb_-UIl2NA:APA91bGXYCEdW_Ig8wQD08xEXtQRdCbUO2l-LpNT2CQVPsuZndBUyh_K6k-dgIc0IOVWZegKaSqozEoeoert40qUgONnXsyFHiLtb9Ie5D1funUpu9ojHTRYTlZJ0bynG49LxNJPBn0a', '2022-06-01 17:43:37', '2022-06-01 17:43:37'),
(391, 738, 'c-UVpWaiA291EjHb3XXo66:APA91bFqvIrJ6vXBXMkcRaKylbs5Vbrq1gURckoEJafKZ8hYSjH7bl4fe7soMQqMsDKrHXpbdeOZRxS_8qF5WnfR5UA84S5jlPTDxfg8KVOcvCEQxreRtPco_G_t0qJaYaB3HEDoaRDB', '2022-06-01 18:17:59', '2022-06-01 18:17:59'),
(392, 753, 'd05aeun_48TpiwQP4Fm48u:APA91bFjLBNbjPjgiX6-0-6gy285Dbms4wNN4ELE4OFSgrzGMeJOZYE2OsVbkIBOB91rXxF6TTcuJ8hutzBRUre48oI3NoxGftuu9ip9dhqwI_bka4jdVxeuJVZdtpAOEqPIHsNygE_W', '2022-06-01 18:21:50', '2022-06-01 18:21:50'),
(393, 747, 'dXSV-EYPDLL9cVLiJBz91-:APA91bGqxQmc5rmB-g3jocd_e8lWFbUUxBSsUqJA7bNb4A30BZGHpOqRFW1sr-aAY32s-gX5eMT9tSZ0-SnLFBAdPHu4tZLSUku4jFDbs7Bv69eHaOiD41mZxRuU2ypdF6G391QdJRVC', '2022-06-01 18:34:59', '2022-06-01 18:34:59'),
(394, 745, 'cufQW2mmaLAuNR9aREdhaQ:APA91bHR0Pa-b263wwD22PXmtIQjIyYvC1EQcEe-XW2nF43LWFpdGPc3J7C1McaZKM3axFvpurgxZzXQOIdoXl02GM96RSYjAnkvLGvDJ_87ptiw8SeKybzdgHK7gumXxkjybZ85hmL3', '2022-06-01 18:36:33', '2022-06-01 18:36:33'),
(395, 696, 'cDkg4ypr0XK6iJu1xJUJ5w:APA91bFHAUAaVBukgCVM6iYvNaCew74M_7CV1TSHaBiV9G07Ykf2V9KXlzvJY-FPMtJ0xAGD7MwFgcROcXtLjbnBpMCrW6Yg_1BJ5Vs-SvdosjpHYbdoZz5fiPNTLqRaW4nrWLxDVH1W', '2022-06-01 20:31:04', '2022-06-02 15:20:09'),
(396, 749, 'c5mnVvCOdbJuqZJnDPDtgB:APA91bFDDMPgZxpyC_EOMXfuzjZBY3-m3JbjwUVdYwp31zcLLHB0ce9MaeG7BaSMJp_DEyc93_XnxXD2ZIFlKGmZUCbAV6ldyjFzj9nQxW77YrX7iWVsWJwLB1d4KegMO7MKFS1rTRYH', '2022-06-01 21:10:48', '2022-06-01 21:10:48'),
(397, 690, 'fzl6GeCChSCP-6hCfC5tIR:APA91bHLdX-ykdz3FBvCRxkWGx2WAjvET0Nc7yaMATCxEbC13ZmMyomukuc5FYi_sixeVv8TmSdMSQ110hh6YqYFLMvw4Zdy8PnKq9RA-zwiFLQOOR5UtXvGkry6K0P3U8PkJWZ7DFPk', '2022-06-01 21:25:42', '2022-06-01 21:25:42'),
(398, 749, 'c5mnVvCOdbJuqZJnDPDtgB:APA91bEPwFvORzyAfoby8-p7fRkfpU28aTkHucfraDV76pDqBt6JfCzYjrDMQg3A1sYOlEpnCA4aQvekpDiSrOUurn51APslxwTracTYe7EVFNPwZ5Ta_mwXfgwplEOt_ds3GuYx_Rzo', '2022-06-02 14:02:58', '2022-06-02 14:02:58'),
(399, 707, 'eA4_btn2UiTxQMtI9m9TlC:APA91bG3S0KzDFo-RixNFSq6tahR4aR6omXrH80Jtpr5jMwXhM6sL81a-c-bCicCxwEt2KxAzQIg64qNdv_cvnNa5kL4OyDCYNKJ-RieXUBDvOWnakaGuiJYL3ZI3c85HsEUgTuRrtND', '2022-06-02 14:12:02', '2022-06-02 14:12:02'),
(400, 743, 'cwXuJHoDzqmbKhQOaocwOp:APA91bEuSqUVYw0DC6RH6H-VBqXFZ25seiJw_F-1srTKR4Q3rMNvPNAFZnLUCBfrTya1PXeJ2ye7ojnrBrDNIUW5jLRAm1Qx7NiUV5lvqvY6ucxCZy06rAmn-7CAHSYTnYR4xv0qHGwZ', '2022-06-02 14:22:39', '2022-06-02 14:22:39'),
(401, 739, 'fiDlf1HZaF92o5BuqqUnYZ:APA91bEUBNavR2EFdBFHGAUum0lD9cKl--TNh-kz2QgIbuUORS-fxdUDOgk6LP9mVLZvOjAQ0_h9hi2t8eCrcq1jmT0K3ejcVnvca5LpKO8EnJfgTmPAk4RmDeIDjj5V6beQmdkc--of', '2022-06-02 14:42:34', '2022-06-02 14:42:34'),
(402, 738, 'd2fl_gSdqjfR0mUPwl6NKN:APA91bGo_FuZEtShp_LCErAQ6JaT0FEy5WLnPM3Jm0zU0q6OXtDz33AKnrKOHhe4055ysuhG71-3ZPuuawEvLMRuwU1Qe0TnhF8KkL0HJL3Y4i22bU_qA-zJgeC8ObRymRAaXSN8ScTY', '2022-06-02 16:45:17', '2022-06-02 16:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `point`, `created_at`, `updated_at`) VALUES
(1, 10, '2022-04-05 10:17:45', '2022-04-11 14:40:50'),
(2, 20, '2022-04-05 16:54:13', '2022-04-11 14:41:08'),
(3, 30, '2022-04-05 16:54:31', '2022-04-11 14:41:15'),
(4, 60, '2022-04-05 16:57:25', '2022-04-11 14:41:22'),
(5, 100, '2022-04-11 14:41:27', '2022-04-11 14:41:27'),
(6, 111421, '2022-05-15 15:49:33', '2022-05-15 15:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Critical', '2022-04-05 11:12:46', '2022-04-19 19:49:13'),
(2, 'High', '2022-04-05 11:13:21', '2022-04-19 19:49:21'),
(3, 'Medium', '2022-04-05 17:10:51', '2022-04-19 19:49:30'),
(4, 'Low', '2022-04-06 11:59:15', '2022-04-19 19:49:58'),
(5, 'شسيسشيشس312', '2022-05-15 15:49:39', '2022-05-15 15:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `project_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `test_url` varchar(191) DEFAULT NULL,
  `test_version` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `description`, `status`, `public`, `start`, `end`, `manager_id`, `test_url`, `test_version`, `created_by`, `updated_at`, `created_at`) VALUES
(1, 'البدر للمبيعات', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 727, '2022-05-08 15:48:51', '2021-01-16 19:18:56'),
(2, 'قسم التسويق و المبيعات', NULL, 1, 0, NULL, NULL, 738, NULL, NULL, 727, '2021-02-01 09:25:05', '2021-01-17 12:39:35'),
(3, 'قسم الحسابات بالشركة', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-02-01 16:09:36', '2021-01-17 12:40:07'),
(4, 'قسم الموارد البشرية', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-02-01 16:09:45', '2021-01-17 12:40:48'),
(5, 'قسم مجلس إدارة الشركة', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-11-28 10:13:07', '2021-01-17 12:41:08'),
(6, 'القسم العام', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-11-28 10:12:46', '2021-01-17 12:41:19'),
(7, 'مشروع برنامج المقاولات', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-01-17 06:41:43', '2021-01-17 12:41:43'),
(8, 'مشروع الحاويات', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-02-01 16:10:11', '2021-01-17 12:41:58'),
(9, 'Mobile Applications', NULL, 0, 0, NULL, NULL, 690, NULL, NULL, 727, '2021-11-28 10:13:51', '2021-01-17 12:42:10'),
(10, 'مشروع مغسلة أكنان', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-11-28 10:01:21', '2021-01-17 12:42:23'),
(11, 'مشروع تفسير الأحلام', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 727, '2021-11-28 10:01:32', '2021-01-17 12:42:37'),
(12, 'موقع وتطبيقات سوق السلطان', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-01-17 06:42:46', '2021-01-17 12:42:46'),
(13, 'مشروع تطبيقات المزادات', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-01-17 06:42:57', '2021-01-17 12:42:57'),
(14, 'ملغي', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 727, '2021-01-17 09:57:05', '2021-01-17 12:43:12'),
(15, 'مزاد 24', NULL, 0, 0, NULL, NULL, 690, NULL, NULL, 727, '2021-11-28 10:01:42', '2021-01-17 12:43:29'),
(16, 'مشروع المهام - داخلي', NULL, 1, 0, NULL, NULL, 687, NULL, NULL, 727, '2022-04-05 23:19:45', '2021-01-17 12:43:43'),
(17, 'ملغي', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-01-17 10:08:24', '2021-01-17 12:43:53'),
(18, 'البدر لإدارة الموارد البشرية', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-02-01 16:10:59', '2021-01-17 12:44:04'),
(19, 'البدر لمراكز الصيانة', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-02-01 16:11:05', '2021-01-17 12:44:14'),
(20, 'إدارة وتنظيم المشاريع', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:14:24', '2021-01-17 12:44:25'),
(21, 'دراسات وتقييمات للمشاريع والتعديلات', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:14:40', '2021-01-17 12:44:37'),
(22, 'قطرة الماء', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:01:53', '2021-01-17 12:44:45'),
(23, 'تطبيق متجر وطن', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-02-01 16:11:48', '2021-01-17 12:44:57'),
(24, 'تطبيق الفنيين', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:09:14', '2021-01-17 12:45:08'),
(25, 'ملغي', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-01-17 12:21:53', '2021-01-17 12:45:21'),
(26, 'ليبيا كارد', NULL, 0, 0, '2021-01-17', '2021-01-21', 737, NULL, NULL, 701, '2021-11-28 10:10:19', '2021-01-17 13:22:55'),
(27, 'Plorer', NULL, 0, 0, '2021-01-17', '2021-01-18', 690, NULL, NULL, 690, '2021-01-17 07:33:20', '2021-01-17 13:33:20'),
(28, 'ملغي', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 698, '2021-01-18 08:03:17', '2021-01-17 13:56:57'),
(29, 'موقع بي تك', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-02-01 16:12:07', '2021-01-17 15:52:57'),
(30, 'متجر Steps', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:09:25', '2021-01-17 18:22:24'),
(31, 'اسأل طبيبك', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:02:35', '2021-01-17 20:12:38'),
(32, 'ملغي', NULL, 0, 0, NULL, NULL, 729, NULL, NULL, 729, '2021-01-18 08:03:52', '2021-01-18 13:49:29'),
(33, 'السمح للذبائح والولائم', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-01-18 08:23:07', '2021-01-18 14:23:07'),
(34, 'الدعم الفنى للمشروعات', NULL, 0, 0, NULL, NULL, 735, NULL, NULL, 727, '2021-11-28 10:16:12', '2021-01-18 14:23:45'),
(35, 'teeeeeest', NULL, 0, 0, '2021-01-11', '2021-01-25', 707, NULL, NULL, 707, '2021-01-25 10:43:51', '2021-01-18 14:41:59'),
(36, 'أعلن', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 737, '2021-01-21 12:39:16', '2021-01-21 18:39:16'),
(37, 'مشروع زينة', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:02:47', '2021-01-23 19:46:21'),
(38, 'صالون تك', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 727, '2021-11-28 10:15:12', '2021-01-23 19:48:18'),
(39, 'التقويم الأبدي', 'تطبيقات اندوريد وايفون', 0, 0, NULL, NULL, NULL, NULL, NULL, 701, '2021-02-10 06:46:10', '2021-01-25 15:40:05'),
(40, 'مشروع لينكى كار', 'مشروع لينكى كار', 1, 0, '2021-01-24', '2021-03-01', 737, NULL, NULL, 696, '2021-02-15 10:21:40', '2021-01-25 20:28:12'),
(41, 'paytic', NULL, 0, 0, '2021-01-27', '2021-01-27', NULL, NULL, NULL, 701, '2021-01-27 11:12:25', '2021-01-27 17:12:25'),
(42, 'ترويج', NULL, 1, 0, NULL, NULL, 737, NULL, NULL, 737, '2021-02-03 14:48:43', '2021-02-03 20:48:43'),
(43, 'البدر لادارة العملاء', 'Badr clients for albadr sales app', 0, 0, NULL, NULL, 696, NULL, NULL, 687, '2021-02-10 08:12:29', '2021-02-10 14:12:29'),
(44, 'أكلات ماما', 'مشروع تطبيق أكلات اماما', 0, 0, '2021-02-01', '2022-02-28', 737, NULL, NULL, 696, '2021-11-28 10:03:05', '2021-02-11 19:22:37'),
(45, 'مشروع Suppliers', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 688, '2021-02-11 14:58:14', '2021-02-11 20:58:14'),
(46, 'T pro', 'مشروع المعاملات اليوميه لمكاتب الطباعه', 0, 0, '2021-02-15', '2021-02-28', 737, NULL, NULL, 696, '2021-11-28 10:03:17', '2021-02-16 00:52:49'),
(47, 'مشروع المرضى -بانوراما', 'مشروع  تطبيق اسنابات للمرضى', 1, 0, '2021-03-09', '2021-04-30', 737, NULL, NULL, 696, '2021-03-09 06:33:11', '2021-02-16 14:48:44'),
(48, 'بلورير', 'مشروع بلورير', 0, 0, '2021-02-16', '2021-02-18', 737, NULL, NULL, 696, '2021-11-28 10:09:40', '2021-02-16 17:48:56'),
(49, 'حراج الطرف', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 730, '2021-02-17 09:11:59', '2021-02-17 15:11:59'),
(50, 'منامات', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 701, '2021-11-28 10:03:54', '2021-02-22 16:05:52'),
(51, 'أكلات ماما', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 690, '2021-11-28 10:15:43', '2021-02-23 21:42:14'),
(52, 'تطبيق المحتوى - ملخصات الكتب', 'مشروع تطبيقات ملخصات الكتب \nتطبيق اندوريد وايفون', 1, 0, '2021-03-01', '2021-05-31', 737, NULL, NULL, 696, '2021-03-01 12:09:50', '2021-03-01 18:09:50'),
(53, 'موقع وتطبيقات اعلن', NULL, 0, 0, NULL, NULL, 737, NULL, NULL, 730, '2021-11-28 10:04:13', '2021-03-04 16:25:54'),
(54, 'أعمال إدارية', 'للمهام الإدارية الخاصه بالشركة', 1, 0, '2021-03-09', '2028-03-04', 696, NULL, NULL, 696, '2021-03-09 06:50:59', '2021-03-09 12:50:59'),
(55, 'ايفينتس', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 736, '2021-11-28 10:05:15', '2021-04-11 15:26:14'),
(56, 'تطبيق الدعم الفنى للشركه', 'مشروع الدعم الفنى  \nربطك بين العملاء والدعم الفنى من خلال تطبيق خاص بالعملاء وداش بورد خاصه بالدعم الفنى', 1, 0, NULL, NULL, 696, NULL, NULL, 739, '2021-04-20 11:52:44', '2021-04-20 16:52:44'),
(57, 'مشروع تطبيقات متكامل', 'مشروع تطبيقات خدمات', 1, 0, '2021-04-28', '2021-06-01', 737, NULL, NULL, 696, '2021-04-29 16:38:11', '2021-04-29 21:38:11'),
(58, '.', NULL, 0, 0, '2021-06-06', '2021-06-07', 699, NULL, NULL, 699, '2021-05-26 16:50:05', '2021-05-26 21:18:28'),
(59, '.', NULL, 0, 0, '2021-06-06', '2021-06-07', 699, NULL, NULL, 699, '2021-05-26 16:40:44', '2021-05-26 21:20:04'),
(60, '.', NULL, 0, 0, '2021-06-26', '2021-06-27', 699, NULL, NULL, 699, '2021-05-26 16:42:31', '2021-05-26 21:21:55'),
(61, '.', NULL, 0, 0, '2021-06-01', '2021-06-03', 699, NULL, NULL, 699, '2021-05-26 16:44:21', '2021-05-26 21:27:52'),
(62, '.', NULL, 0, 0, '2021-05-30', '2021-06-01', 699, NULL, NULL, 699, '2021-05-26 16:45:55', '2021-05-26 21:31:24'),
(63, '.', NULL, 0, 0, '2021-05-29', '2021-05-01', 699, NULL, NULL, 699, '2021-05-26 16:49:27', '2021-05-26 21:32:22'),
(64, 'مراكيض ميدان السيح', NULL, 0, 0, NULL, NULL, 696, NULL, NULL, 739, '2021-11-28 10:05:28', '2021-06-15 21:22:47'),
(65, 'إدارة مواقع', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 732, '2021-08-05 10:36:50', '2021-08-05 15:36:50'),
(66, 'موقع دكتور حسام', NULL, 0, 0, NULL, NULL, 687, NULL, NULL, 707, '2021-11-28 10:10:56', '2021-10-14 17:52:29'),
(67, 'بيت السبح', 'متجر بيت السبح', 1, 0, NULL, NULL, 687, NULL, NULL, 691, '2021-10-17 09:17:44', '2021-10-17 14:17:44'),
(68, 'مشروع تست', NULL, 0, 0, NULL, NULL, 687, NULL, NULL, 736, '2021-11-28 10:04:42', '2021-10-24 18:09:57'),
(69, 'مصحف القران الكريم', NULL, 1, 0, NULL, NULL, 687, NULL, NULL, 739, '2021-10-25 11:14:00', '2021-10-25 16:14:00'),
(70, 'التمريض', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 739, '2021-11-07 15:23:39', '2021-11-07 21:23:39'),
(71, 'مشروع الصيانه ( firefighting )', NULL, 1, 0, NULL, NULL, 696, NULL, NULL, 730, '2021-11-22 15:47:18', '2021-11-22 21:47:18'),
(72, 'Home Medical Services ( HMS )', NULL, 1, 0, NULL, NULL, 687, NULL, NULL, 730, '2022-05-23 08:42:59', '2021-11-24 03:58:32'),
(73, 'الحسابات', 'حسابات', 1, 0, '2022-02-06', '2026-02-01', 699, NULL, NULL, 699, '2022-02-06 19:11:00', '2022-02-07 01:06:58'),
(74, 'سوق البدر', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 736, '2022-04-18 11:30:17', '2022-04-18 16:30:17'),
(75, 'المتاجر الالكترونية للبدر', NULL, 1, 0, NULL, NULL, 739, NULL, NULL, 739, '2022-04-24 14:19:31', '2022-04-24 19:19:31'),
(76, 'المدينة الرقمية', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 732, '2022-04-26 15:01:57', '2022-04-26 20:01:57'),
(77, 'test', 'test', 0, 0, NULL, NULL, 736, 'test', 'test', 736, '2022-05-15 10:40:13', '2022-05-15 15:26:31'),
(78, 'test', 'test', 0, 0, NULL, NULL, 736, 'test', 'test', 736, '2022-05-15 10:39:54', '2022-05-15 15:26:38'),
(79, 'سكاى شوب', NULL, 1, 0, NULL, NULL, 739, NULL, NULL, 739, '2022-05-16 10:56:03', '2022-05-16 15:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `project_folders`
--

CREATE TABLE `project_folders` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `folder_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upper_folder` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_report_achieves`
--

CREATE TABLE `project_report_achieves` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `done` mediumtext COLLATE utf8mb4_unicode_ci,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_team`
--

CREATE TABLE `project_team` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `role_description` text COLLATE utf8_unicode_ci,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_team`
--

INSERT INTO `project_team` (`id`, `project_id`, `employee_id`, `role_description`, `start`, `end`, `updated_at`, `created_at`) VALUES
(1, 1, 727, NULL, NULL, NULL, NULL, '2021-01-16 13:18:56'),
(2, 2, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:39:35'),
(3, 3, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:40:07'),
(4, 4, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:40:48'),
(5, 5, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:41:08'),
(6, 6, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:41:19'),
(7, 7, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:41:44'),
(8, 8, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:41:58'),
(9, 9, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:42:10'),
(10, 10, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:42:23'),
(11, 11, 696, NULL, NULL, NULL, NULL, '2021-01-17 06:42:37'),
(12, 11, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:42:37'),
(13, 12, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:42:46'),
(14, 13, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:42:57'),
(16, 15, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:43:29'),
(19, 18, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:44:04'),
(20, 19, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:44:14'),
(21, 20, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:44:25'),
(22, 21, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:44:37'),
(23, 22, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:44:45'),
(25, 24, 727, NULL, NULL, NULL, NULL, '2021-01-17 06:45:08'),
(27, 26, 701, NULL, NULL, NULL, NULL, '2021-01-17 07:22:55'),
(28, 27, 690, NULL, NULL, NULL, NULL, '2021-01-17 07:33:20'),
(29, 27, 690, NULL, NULL, NULL, NULL, '2021-01-17 07:33:20'),
(30, 27, 691, NULL, NULL, NULL, NULL, '2021-01-17 07:34:37'),
(31, 27, 688, NULL, NULL, NULL, NULL, '2021-01-17 07:34:37'),
(32, 27, 696, NULL, NULL, NULL, NULL, '2021-01-17 07:34:37'),
(34, 29, 698, NULL, NULL, NULL, NULL, '2021-01-17 09:52:58'),
(35, 29, 690, NULL, NULL, NULL, NULL, '2021-01-17 09:52:58'),
(36, 29, 693, NULL, NULL, NULL, NULL, '2021-01-17 09:52:58'),
(37, 29, 696, NULL, NULL, NULL, NULL, '2021-01-17 09:52:58'),
(38, 29, 701, NULL, NULL, NULL, NULL, '2021-01-17 09:52:58'),
(41, 31, 727, NULL, NULL, NULL, NULL, '2021-01-17 14:12:38'),
(44, 33, 727, NULL, NULL, NULL, NULL, '2021-01-18 08:23:07'),
(45, 34, 727, NULL, NULL, NULL, NULL, '2021-01-18 08:23:45'),
(46, 35, 707, NULL, NULL, NULL, NULL, '2021-01-18 08:41:59'),
(47, 36, 691, NULL, NULL, NULL, NULL, '2021-01-21 12:39:16'),
(48, 36, 701, NULL, NULL, NULL, NULL, '2021-01-21 12:39:16'),
(49, 36, 737, NULL, NULL, NULL, NULL, '2021-01-21 12:39:16'),
(50, 36, 733, NULL, NULL, NULL, NULL, '2021-01-21 12:39:54'),
(51, 37, 727, NULL, NULL, NULL, NULL, '2021-01-23 13:46:21'),
(52, 38, 727, NULL, NULL, NULL, NULL, '2021-01-23 13:48:18'),
(53, 39, 701, NULL, NULL, NULL, NULL, '2021-01-25 07:40:05'),
(54, 40, 696, NULL, NULL, NULL, NULL, '2021-01-25 12:28:12'),
(55, 40, 688, NULL, NULL, NULL, NULL, '2021-01-25 12:28:12'),
(56, 40, 730, NULL, NULL, NULL, NULL, '2021-01-25 12:28:12'),
(57, 40, 696, NULL, NULL, NULL, NULL, '2021-01-25 12:28:12'),
(58, 41, 701, NULL, NULL, NULL, NULL, '2021-01-27 09:12:25'),
(59, 42, 691, NULL, NULL, NULL, NULL, '2021-02-03 12:48:43'),
(60, 42, 693, NULL, NULL, NULL, NULL, '2021-02-03 12:48:43'),
(61, 42, 737, NULL, NULL, NULL, NULL, '2021-02-03 12:48:43'),
(62, 43, 687, NULL, NULL, NULL, NULL, '2021-02-10 06:12:29'),
(63, 43, 687, NULL, NULL, NULL, NULL, '2021-02-10 06:12:29'),
(64, 44, 698, NULL, NULL, NULL, NULL, '2021-02-11 11:22:37'),
(65, 44, 696, NULL, NULL, NULL, NULL, '2021-02-11 11:22:37'),
(66, 45, 688, NULL, NULL, NULL, NULL, '2021-02-11 12:58:14'),
(67, 45, 688, NULL, NULL, NULL, NULL, '2021-02-11 12:58:14'),
(68, 46, 691, NULL, NULL, NULL, NULL, '2021-02-15 16:52:49'),
(69, 46, 696, NULL, NULL, NULL, NULL, '2021-02-15 16:52:49'),
(70, 47, 727, NULL, NULL, NULL, NULL, '2021-02-16 06:48:44'),
(71, 47, 696, NULL, NULL, NULL, NULL, '2021-02-16 06:48:44'),
(72, 48, 690, NULL, NULL, NULL, NULL, '2021-02-16 09:48:56'),
(73, 48, 696, NULL, NULL, NULL, NULL, '2021-02-16 09:48:56'),
(74, 49, 730, NULL, NULL, NULL, NULL, '2021-02-17 07:11:59'),
(75, 50, 701, NULL, NULL, NULL, NULL, '2021-02-22 08:05:52'),
(76, 51, 690, NULL, NULL, NULL, NULL, '2021-02-23 13:42:14'),
(77, 51, 698, NULL, NULL, NULL, NULL, '2021-02-23 13:42:14'),
(78, 51, 737, NULL, NULL, NULL, NULL, '2021-02-23 13:42:14'),
(79, 51, 690, NULL, NULL, NULL, NULL, '2021-02-23 13:42:14'),
(80, 52, 696, NULL, NULL, NULL, NULL, '2021-03-01 10:09:50'),
(81, 53, 730, NULL, NULL, NULL, NULL, '2021-03-04 08:25:54'),
(82, 53, 730, NULL, NULL, NULL, NULL, '2021-03-04 08:25:54'),
(83, 54, 691, NULL, NULL, NULL, NULL, '2021-03-09 04:50:59'),
(84, 54, 699, NULL, NULL, NULL, NULL, '2021-03-09 04:50:59'),
(85, 54, 696, NULL, NULL, NULL, NULL, '2021-03-09 04:50:59'),
(86, 55, 736, NULL, NULL, NULL, NULL, '2021-04-11 08:26:14'),
(87, 56, 730, NULL, NULL, NULL, NULL, '2021-04-20 09:52:44'),
(88, 56, 739, NULL, NULL, NULL, NULL, '2021-04-20 09:52:44'),
(89, 57, 696, NULL, NULL, NULL, NULL, '2021-04-29 14:38:12'),
(90, 57, 696, NULL, NULL, NULL, NULL, '2021-04-29 14:38:12'),
(107, 64, 688, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(108, 64, 707, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(109, 64, 737, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(110, 64, 730, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(111, 64, 739, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(112, 64, 741, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(113, 64, 739, NULL, NULL, NULL, NULL, '2021-06-15 14:22:47'),
(114, 1, 696, NULL, NULL, NULL, NULL, '2021-06-20 03:07:37'),
(115, 1, 725, NULL, NULL, NULL, NULL, '2021-06-20 03:07:37'),
(116, 1, 700, NULL, NULL, NULL, NULL, '2021-06-20 03:07:37'),
(117, 65, 732, NULL, NULL, NULL, NULL, '2021-08-05 08:36:50'),
(118, 65, 707, NULL, NULL, NULL, NULL, '2021-08-05 08:36:50'),
(119, 65, 732, NULL, NULL, NULL, NULL, '2021-08-05 08:36:50'),
(120, 66, 707, NULL, NULL, NULL, NULL, '2021-10-14 10:52:29'),
(121, 66, 707, NULL, NULL, NULL, NULL, '2021-10-14 10:52:29'),
(122, 67, 691, NULL, NULL, NULL, NULL, '2021-10-17 07:17:44'),
(123, 67, 691, NULL, NULL, NULL, NULL, '2021-10-17 07:17:44'),
(124, 68, 687, NULL, NULL, NULL, NULL, '2021-10-24 11:09:57'),
(125, 68, 688, NULL, NULL, NULL, NULL, '2021-10-24 11:09:57'),
(129, 69, 690, NULL, NULL, NULL, NULL, '2021-10-25 09:14:00'),
(130, 69, 739, NULL, NULL, NULL, NULL, '2021-10-25 09:14:00'),
(131, 69, 741, NULL, NULL, NULL, NULL, '2021-10-25 09:14:00'),
(132, 69, 739, NULL, NULL, NULL, NULL, '2021-10-25 09:14:00'),
(133, 70, 739, NULL, NULL, NULL, NULL, '2021-11-07 13:23:39'),
(134, 71, 730, NULL, NULL, NULL, NULL, '2021-11-22 13:47:18'),
(135, 71, 730, NULL, NULL, NULL, NULL, '2021-11-22 13:47:18'),
(138, 73, 696, NULL, NULL, NULL, NULL, '2022-02-06 17:06:58'),
(139, 73, 699, NULL, NULL, NULL, NULL, '2022-02-06 17:06:58'),
(140, 73, 699, NULL, NULL, NULL, NULL, '2022-02-06 17:06:58'),
(141, 1, 691, NULL, NULL, NULL, NULL, '2022-03-21 12:20:00'),
(142, 1, 691, NULL, NULL, NULL, NULL, '2022-03-21 12:24:02'),
(143, 1, 688, NULL, NULL, NULL, NULL, '2022-03-21 12:24:02'),
(144, 1, 690, NULL, NULL, NULL, NULL, '2022-03-21 12:27:43'),
(145, 29, 707, NULL, NULL, NULL, NULL, '2022-03-22 09:56:00'),
(146, 68, 687, NULL, NULL, NULL, NULL, '2022-03-22 11:05:20'),
(147, 68, 690, NULL, NULL, NULL, NULL, '2022-03-22 11:05:20'),
(148, 16, 687, NULL, NULL, NULL, NULL, '2022-04-05 21:19:45'),
(149, 16, 707, NULL, NULL, NULL, NULL, '2022-04-05 21:19:45'),
(150, 74, 736, NULL, NULL, NULL, NULL, '2022-04-18 09:30:17'),
(151, 75, 736, NULL, NULL, NULL, NULL, '2022-04-24 12:19:31'),
(152, 75, 739, NULL, NULL, NULL, NULL, '2022-04-24 12:19:31'),
(153, 76, 732, NULL, NULL, NULL, NULL, '2022-04-26 13:01:57'),
(154, 77, 736, NULL, NULL, NULL, NULL, '2022-05-15 08:26:31'),
(157, 78, 736, NULL, NULL, NULL, NULL, '2022-05-15 08:26:38'),
(160, 79, 739, NULL, NULL, NULL, NULL, '2022-05-16 08:56:03'),
(161, 16, 741, NULL, NULL, NULL, NULL, '2022-06-01 09:06:42'),
(162, 1, 707, NULL, NULL, NULL, NULL, '2022-06-01 09:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `project_team_permission`
--

CREATE TABLE `project_team_permission` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_team_permission`
--

INSERT INTO `project_team_permission` (`id`, `project_id`, `employee_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 698, 1, '2022-04-10 07:16:49', NULL),
(21, 44, 688, 1, '2022-04-11 11:20:24', NULL),
(22, 44, 688, 2, '2022-04-11 11:20:25', NULL),
(23, 44, 688, 3, '2022-04-11 11:20:25', NULL),
(24, 44, 688, 4, '2022-04-11 11:20:25', NULL),
(25, 44, 688, 5, '2022-04-11 11:20:25', NULL),
(26, 44, 688, 6, '2022-04-11 11:20:25', NULL),
(27, 44, 688, 7, '2022-04-11 11:20:25', NULL),
(28, 44, 688, 8, '2022-04-11 11:20:25', NULL),
(29, 44, 688, 9, '2022-04-11 11:20:25', NULL),
(30, 44, 688, 10, '2022-04-11 11:20:25', NULL),
(31, 44, 688, 11, '2022-04-11 11:20:25', NULL),
(32, 44, 688, 12, '2022-04-11 11:20:25', NULL),
(33, 44, 688, 13, '2022-04-11 11:20:25', NULL),
(34, 44, 688, 14, '2022-04-11 11:20:25', NULL),
(35, 44, 688, 15, '2022-04-11 11:20:25', NULL),
(36, 44, 688, 16, '2022-04-11 11:20:25', NULL),
(37, 44, 688, 17, '2022-04-11 11:20:25', NULL),
(38, 44, 688, 18, '2022-04-11 11:20:25', NULL),
(39, 44, 688, 19, '2022-04-11 11:20:25', NULL),
(40, 44, 688, 20, '2022-04-11 11:20:25', NULL),
(41, 44, 688, 21, '2022-04-11 11:20:25', NULL),
(42, 1, 696, 1, '2022-04-12 08:25:38', NULL),
(43, 1, 696, 2, '2022-04-12 08:25:38', NULL),
(44, 1, 696, 3, '2022-04-12 08:25:38', NULL),
(45, 1, 696, 4, '2022-04-12 08:25:38', NULL),
(46, 1, 696, 5, '2022-04-12 08:25:38', NULL),
(47, 1, 696, 6, '2022-04-12 08:25:38', NULL),
(48, 1, 696, 7, '2022-04-12 08:25:38', NULL),
(49, 1, 696, 8, '2022-04-12 08:25:38', NULL),
(50, 1, 696, 9, '2022-04-12 08:25:38', NULL),
(51, 1, 696, 10, '2022-04-12 08:25:38', NULL),
(52, 1, 696, 11, '2022-04-12 08:25:38', NULL),
(53, 1, 696, 12, '2022-04-12 08:25:38', NULL),
(54, 1, 696, 13, '2022-04-12 08:25:38', NULL),
(55, 1, 696, 14, '2022-04-12 08:25:38', NULL),
(56, 1, 696, 15, '2022-04-12 08:25:38', NULL),
(57, 1, 696, 16, '2022-04-12 08:25:38', NULL),
(58, 1, 696, 17, '2022-04-12 08:25:38', NULL),
(59, 1, 696, 18, '2022-04-12 08:25:38', NULL),
(60, 1, 696, 19, '2022-04-12 08:25:38', NULL),
(61, 1, 696, 20, '2022-04-12 08:25:38', NULL),
(63, 78, 687, 1, '2022-05-15 08:31:41', NULL),
(64, 78, 687, 2, '2022-05-15 08:31:41', NULL),
(65, 78, 687, 3, '2022-05-15 08:31:41', NULL),
(66, 78, 687, 4, '2022-05-15 08:31:41', NULL),
(67, 78, 687, 5, '2022-05-15 08:31:41', NULL),
(68, 78, 687, 6, '2022-05-15 08:31:41', NULL),
(69, 78, 687, 7, '2022-05-15 08:31:41', NULL),
(70, 78, 687, 8, '2022-05-15 08:31:41', NULL),
(71, 78, 687, 9, '2022-05-15 08:31:41', NULL),
(72, 78, 687, 10, '2022-05-15 08:31:41', NULL),
(73, 78, 687, 11, '2022-05-15 08:31:41', NULL),
(74, 78, 687, 12, '2022-05-15 08:31:41', NULL),
(75, 78, 687, 13, '2022-05-15 08:31:41', NULL),
(76, 78, 687, 14, '2022-05-15 08:31:41', NULL),
(77, 78, 687, 15, '2022-05-15 08:31:41', NULL),
(78, 78, 687, 16, '2022-05-15 08:31:41', NULL),
(79, 78, 687, 17, '2022-05-15 08:31:41', NULL),
(80, 78, 687, 18, '2022-05-15 08:31:41', NULL),
(81, 78, 687, 19, '2022-05-15 08:31:41', NULL),
(82, 78, 687, 20, '2022-05-15 08:31:41', NULL),
(83, 78, 687, 21, '2022-05-15 08:31:41', NULL),
(84, 78, 698, 11, '2022-05-15 08:32:08', NULL),
(85, 78, 698, 6, '2022-05-15 08:32:08', NULL),
(86, 78, 698, 18, '2022-05-15 08:32:08', NULL),
(87, 78, 698, 16, '2022-05-15 08:32:08', NULL),
(88, 78, 698, 14, '2022-05-15 08:32:08', NULL),
(89, 78, 698, 12, '2022-05-15 08:32:08', NULL),
(90, 78, 698, 9, '2022-05-15 08:32:08', NULL),
(91, 78, 698, 15, '2022-05-15 08:32:08', NULL),
(92, 78, 698, 17, '2022-05-15 08:32:08', NULL),
(93, 78, 698, 19, '2022-05-15 08:32:08', NULL),
(94, 78, 698, 13, '2022-05-15 08:32:08', NULL),
(95, 43, 687, 1, '2022-05-29 08:40:37', NULL),
(96, 43, 687, 2, '2022-05-29 08:40:37', NULL),
(97, 43, 687, 3, '2022-05-29 08:40:37', NULL),
(98, 43, 687, 4, '2022-05-29 08:40:37', NULL),
(99, 43, 687, 5, '2022-05-29 08:40:37', NULL),
(100, 43, 687, 6, '2022-05-29 08:40:37', NULL),
(101, 43, 687, 7, '2022-05-29 08:40:37', NULL),
(102, 43, 687, 8, '2022-05-29 08:40:37', NULL),
(103, 43, 687, 9, '2022-05-29 08:40:37', NULL),
(104, 43, 687, 10, '2022-05-29 08:40:37', NULL),
(105, 43, 687, 11, '2022-05-29 08:40:38', NULL),
(106, 43, 687, 12, '2022-05-29 08:40:38', NULL),
(107, 43, 687, 13, '2022-05-29 08:40:38', NULL),
(108, 43, 687, 14, '2022-05-29 08:40:38', NULL),
(109, 43, 687, 15, '2022-05-29 08:40:38', NULL),
(110, 43, 687, 16, '2022-05-29 08:40:38', NULL),
(111, 43, 687, 17, '2022-05-29 08:40:38', NULL),
(112, 43, 687, 18, '2022-05-29 08:40:38', NULL),
(113, 43, 687, 19, '2022-05-29 08:40:38', NULL),
(114, 43, 687, 20, '2022-05-29 08:40:38', NULL),
(115, 43, 687, 21, '2022-05-29 08:40:38', NULL),
(116, 43, 687, 22, '2022-05-29 08:40:38', NULL),
(117, 43, 687, 23, '2022-05-29 08:40:38', NULL),
(118, 43, 687, 24, '2022-05-29 08:40:38', NULL),
(119, 43, 687, 25, '2022-05-29 08:40:38', NULL),
(120, 43, 687, 26, '2022-05-29 08:40:38', NULL),
(121, 43, 687, 27, '2022-05-29 08:40:38', NULL),
(122, 43, 687, 28, '2022-05-29 08:40:38', NULL),
(123, 43, 687, 29, '2022-05-29 08:40:38', NULL),
(124, 43, 687, 30, '2022-05-29 08:40:38', NULL),
(125, 43, 687, 31, '2022-05-29 08:40:38', NULL),
(126, 16, 741, 1, '2022-06-01 09:06:57', NULL),
(127, 16, 741, 2, '2022-06-01 09:06:57', NULL),
(128, 16, 741, 3, '2022-06-01 09:06:57', NULL),
(129, 16, 741, 4, '2022-06-01 09:06:57', NULL),
(130, 16, 741, 5, '2022-06-01 09:06:57', NULL),
(131, 16, 741, 6, '2022-06-01 09:06:57', NULL),
(132, 16, 741, 7, '2022-06-01 09:06:57', NULL),
(133, 16, 741, 8, '2022-06-01 09:06:57', NULL),
(134, 16, 741, 9, '2022-06-01 09:06:57', NULL),
(135, 16, 741, 10, '2022-06-01 09:06:57', NULL),
(136, 16, 741, 11, '2022-06-01 09:06:57', NULL),
(137, 16, 741, 12, '2022-06-01 09:06:57', NULL),
(138, 16, 741, 13, '2022-06-01 09:06:57', NULL),
(139, 16, 741, 14, '2022-06-01 09:06:57', NULL),
(140, 16, 741, 15, '2022-06-01 09:06:57', NULL),
(141, 16, 741, 16, '2022-06-01 09:06:57', NULL),
(142, 16, 741, 17, '2022-06-01 09:06:57', NULL),
(143, 16, 741, 18, '2022-06-01 09:06:57', NULL),
(144, 16, 741, 19, '2022-06-01 09:06:57', NULL),
(145, 16, 741, 20, '2022-06-01 09:06:57', NULL),
(146, 16, 741, 22, '2022-06-01 09:06:57', NULL),
(147, 16, 741, 23, '2022-06-01 09:06:57', NULL),
(148, 16, 741, 24, '2022-06-01 09:06:57', NULL),
(149, 16, 741, 25, '2022-06-01 09:06:57', NULL),
(150, 16, 741, 26, '2022-06-01 09:06:57', NULL),
(151, 16, 741, 27, '2022-06-01 09:06:57', NULL),
(152, 16, 741, 28, '2022-06-01 09:06:57', NULL),
(153, 16, 741, 29, '2022-06-01 09:06:57', NULL),
(154, 16, 741, 30, '2022-06-01 09:06:57', NULL),
(155, 16, 741, 31, '2022-06-01 09:06:57', NULL),
(156, 16, 741, 32, '2022-06-01 09:06:57', NULL),
(157, 16, 741, 33, '2022-06-01 09:06:57', NULL),
(158, 16, 741, 34, '2022-06-01 09:06:57', NULL),
(159, 16, 741, 35, '2022-06-01 09:06:57', NULL),
(160, 16, 741, 36, '2022-06-01 09:06:57', NULL),
(161, 16, 741, 42, '2022-06-01 09:06:57', NULL),
(162, 16, 741, 43, '2022-06-01 09:06:57', NULL),
(163, 16, 741, 44, '2022-06-01 09:06:57', NULL),
(164, 16, 741, 45, '2022-06-01 09:06:57', NULL),
(165, 16, 741, 46, '2022-06-01 09:06:57', NULL),
(166, 16, 741, 47, '2022-06-01 09:06:57', NULL),
(167, 16, 741, 48, '2022-06-01 09:06:57', NULL),
(168, 16, 741, 49, '2022-06-01 09:06:57', NULL),
(169, 16, 741, 50, '2022-06-01 09:06:57', NULL),
(170, 16, 741, 51, '2022-06-01 09:06:57', NULL),
(171, 16, 741, 52, '2022-06-01 09:06:57', NULL),
(172, 16, 741, 53, '2022-06-01 09:06:57', NULL),
(173, 16, 741, 54, '2022-06-01 09:06:57', NULL),
(174, 16, 741, 55, '2022-06-01 09:06:57', NULL),
(175, 16, 741, 58, '2022-06-01 09:06:57', NULL),
(176, 16, 741, 59, '2022-06-01 09:06:57', NULL),
(177, 16, 741, 60, '2022-06-01 09:06:57', NULL),
(178, 16, 741, 61, '2022-06-01 09:06:57', NULL),
(179, 16, 741, 62, '2022-06-01 09:06:57', NULL),
(180, 16, 741, 63, '2022-06-01 09:06:57', NULL),
(181, 16, 741, 64, '2022-06-01 09:06:57', NULL),
(182, 16, 741, 65, '2022-06-01 09:06:57', NULL),
(183, 16, 741, 66, '2022-06-01 09:06:57', NULL),
(184, 16, 741, 67, '2022-06-01 09:06:57', NULL),
(185, 16, 741, 68, '2022-06-01 09:06:57', NULL),
(186, 16, 741, 69, '2022-06-01 09:06:57', NULL),
(187, 16, 741, 70, '2022-06-01 09:06:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_team_transaction`
--

CREATE TABLE `project_team_transaction` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `done` text COLLATE utf8_unicode_ci,
  `progress` text COLLATE utf8_unicode_ci,
  `problem` text COLLATE utf8_unicode_ci,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `feedback` text COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `admin_all` tinyint(1) DEFAULT NULL,
  `admin_hrm` tinyint(1) DEFAULT NULL,
  `admin_projects` tinyint(1) DEFAULT NULL,
  `admin_document` tinyint(1) DEFAULT NULL,
  `hrm_emp_show` tinyint(1) DEFAULT NULL,
  `hrm_emp_edit` tinyint(1) DEFAULT NULL,
  `hrm_reports` tinyint(1) DEFAULT NULL,
  `project_reports` tinyint(1) DEFAULT NULL,
  `project_emp_show` tinyint(1) DEFAULT NULL,
  `project_edit` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE `runs` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_case_id` int(11) NOT NULL,
  `story_id` int(11) DEFAULT NULL,
  `run_by` int(11) NOT NULL,
  `status` enum('pass','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_data` text COLLATE utf8mb4_unicode_ci,
  `actual_result` longtext COLLATE utf8mb4_unicode_ci,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `run_attributes`
--

CREATE TABLE `run_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `run_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salaryadd`
--

CREATE TABLE `salaryadd` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salaryaddtypes_id` int(11) NOT NULL,
  `additional_salary_value` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salaryaddtypes`
--

CREATE TABLE `salaryaddtypes` (
  `id` int(11) NOT NULL,
  `salaryaddtypes_name` varchar(255) NOT NULL,
  `salaryaddtypes_type` int(11) NOT NULL,
  `salaryaddtype_value` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salarycomponent`
--

CREATE TABLE `salarycomponent` (
  `id` int(11) NOT NULL,
  `component_name` varchar(200) NOT NULL,
  `is_basic` tinyint(1) NOT NULL,
  `plusOrMinus` tinyint(1) NOT NULL COMMENT '1-->plus ,0-->minus',
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_emp`
--

CREATE TABLE `salary_emp` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `w_mins` int(11) DEFAULT NULL,
  `m_mins` int(11) DEFAULT NULL,
  `total_absent_cut` decimal(11,2) NOT NULL,
  `net_amount` decimal(10,2) NOT NULL,
  `total_cut` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `overtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_emp_details`
--

CREATE TABLE `salary_emp_details` (
  `id` int(11) NOT NULL,
  `Salary_emp_id` int(11) DEFAULT NULL,
  `Com_id` int(11) DEFAULT NULL COMMENT 'component id',
  `amount` decimal(10,0) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user1_id` int(10) UNSIGNED NOT NULL,
  `user2_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_attributes`
--

CREATE TABLE `shared_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` int(11) NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `shift_extra` decimal(10,2) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_descrip` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(10) UNSIGNED NOT NULL,
  `milestone_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_result` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `from` enum('internal','client') NOT NULL DEFAULT 'internal',
  `task_type_id` int(11) NOT NULL DEFAULT '1',
  `milestone_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `task_name` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `details` longtext,
  `priority` enum('none','low','medium','high','critical') NOT NULL DEFAULT 'none',
  `severity` enum('critical','major','minor','low','none') NOT NULL DEFAULT 'none',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` enum('open','in_progress','on_hold','to_be_tested','delayed','to_contact_client','waiting_client_reply','closed','cancelled') NOT NULL DEFAULT 'open',
  `task_status_id` int(11) DEFAULT NULL,
  `duration` decimal(16,2) DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `responsible_id` int(10) NOT NULL,
  `review_status` enum('initial','done','rejected') NOT NULL DEFAULT 'initial',
  `support_code` varchar(255) DEFAULT NULL,
  `is_support` int(1) NOT NULL DEFAULT '0' COMMENT '0 for not support 1 for support',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `run_id` int(11) DEFAULT NULL,
  `backlog_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_comments`
--

CREATE TABLE `tasks_comments` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `comment` mediumtext CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_files`
--

CREATE TABLE `tasks_files` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ext` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_followers`
--

CREATE TABLE `tasks_followers` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_type`
--

CREATE TABLE `tasks_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks_type`
--

INSERT INTO `tasks_type` (`id`, `name`) VALUES
(1, 'Task'),
(2, 'Issue'),
(3, 'New Request');

-- --------------------------------------------------------

--
-- Table structure for table `task_statuses`
--

CREATE TABLE `task_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('open','close') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_statuses`
--

INSERT INTO `task_statuses` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'open', 'open', '2021-10-19 17:56:23', '2021-10-19 17:56:23'),
(2, 'in_progress', 'open', '2021-10-19 18:08:19', '2021-10-19 18:08:19'),
(3, 'on_hold', 'close', '2021-10-19 18:08:28', '2022-01-30 16:07:30'),
(4, 'to_be_tested', 'open', '2021-10-19 18:08:38', '2021-10-19 18:08:38'),
(5, 'delayed', 'close', '2021-10-19 18:08:46', '2022-01-30 16:07:59'),
(6, 'to_contact_client', 'open', '2021-10-19 18:08:59', '2021-10-19 18:08:59'),
(7, 'waiting_client_reply', 'open', '2021-10-19 18:09:15', '2021-10-19 18:09:15'),
(8, 'closed', 'close', '2021-10-19 18:09:22', '2021-10-19 18:09:22'),
(9, 'cancelled', 'close', '2021-10-19 18:09:34', '2021-10-19 18:09:34'),
(10, 'اقترحات تطوير', 'close', '2021-10-27 01:41:50', '2022-01-30 16:07:44'),
(11, 'QRCODE UPDATE', 'open', '2021-11-30 03:06:01', '2021-11-30 03:06:01'),
(12, 'test test test test test', 'open', '2022-05-15 15:45:54', '2022-05-15 15:45:54'),
(13, 'test ؤمخسث', 'close', '2022-05-15 15:46:01', '2022-05-15 15:46:01'),
(14, 'test test test test test test test test test test test test 22', 'open', '2022-05-15 15:46:12', '2022-05-15 15:46:12'),
(15, '1111111112222222222', 'close', '2022-05-15 15:46:33', '2022-05-15 15:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `test_cases`
--

CREATE TABLE `test_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_steps` text COLLATE utf8mb4_unicode_ci,
  `expected_result` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('sub','basic') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `created_by` int(11) NOT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_case_story`
--

CREATE TABLE `test_case_story` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_case_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `track_date` date NOT NULL,
  `track_name` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `id` int(11) NOT NULL,
  `Vacations` varchar(45) DEFAULT NULL,
  `entitlement` tinyint(1) DEFAULT NULL,
  `month_max` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vacationsbalance`
--

CREATE TABLE `vacationsbalance` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `V_type` int(11) DEFAULT NULL,
  `V_Period` int(11) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL,
  `Current_Balance` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vacationsperiod`
--

CREATE TABLE `vacationsperiod` (
  `id` int(11) NOT NULL,
  `Start_date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Period_name` varchar(45) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `weekend`
--

CREATE TABLE `weekend` (
  `id` int(11) NOT NULL,
  `day_name` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wikis`
--

CREATE TABLE `wikis` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wikis`
--

INSERT INTO `wikis` (`id`, `project_id`, `category_id`, `title`, `file`, `description`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 24, 'wiki test 1', 'wikis_files/1/250px-Oversight_logo.png', '<p>wiki details test www</p>', '2022-04-17 16:31:10', '2022-04-17 16:31:10', 736),
(2, NULL, 16, 'wiki title', 'wikis_files/2/2048px-Wikipedia_logo_28svg29.svg.png', '<p>organiz wiki</p>', '2022-04-17 16:32:55', '2022-04-17 16:32:55', 757),
(3, 78, 21, 'Gloria Powelld2', 'wikis_files/3/Doctor-working-on-a-virtual-sc.jpg', '<p>Eveniet, culpa assum.2</p>', '2022-05-15 15:29:20', '2022-05-15 15:30:08', 736),
(4, 78, 18, 'Noah Lopez2', 'wikis_files/4/إصلاحات بايتيك(5) (1).docx', '<p>Fuga. Consequat. Und.2</p>', '2022-05-15 15:29:48', '2022-05-15 15:30:16', 736),
(5, 78, 16, 'testtesttesttest', 'wikis_files/5/images (18).jpg', '<p>test test test test test test test test test test test test test test test test test test </p>', '2022-05-15 15:42:22', '2022-05-15 15:42:22', 736),
(6, NULL, 19, 'test test test 23', NULL, '<p>test test test 22</p>', '2022-05-15 15:42:49', '2022-05-15 15:42:49', 736);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absent_permissions`
--
ALTER TABLE `absent_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attend_device`
--
ALTER TABLE `attend_device`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iMachineNumber` (`iMachineNumber`),
  ADD KEY `iMachineNumber_2` (`iMachineNumber`);

--
-- Indexes for table `backlogs`
--
ALTER TABLE `backlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracttype`
--
ALTER TABLE `contracttype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Column4_index` (`gendr`),
  ADD KEY `Column5_index` (`department_id`),
  ADD KEY `Column6_index` (`job_id`);

--
-- Indexes for table `data22`
--
ALTER TABLE `data22`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Column4_index` (`gendr`),
  ADD KEY `Column5_index` (`department_id`),
  ADD KEY `Column6_index` (`job_id`);

--
-- Indexes for table `debit`
--
ALTER TABLE `debit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debitsettings`
--
ALTER TABLE `debitsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debittype`
--
ALTER TABLE `debittype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_folders`
--
ALTER TABLE `default_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empcomponent`
--
ALTER TABLE `empcomponent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `finger_id` (`finger_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `login_status` (`login_status`);

--
-- Indexes for table `employee_permission`
--
ALTER TABLE `employee_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `employee_points`
--
ALTER TABLE `employee_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_attendance_temp`
--
ALTER TABLE `emp_attendance_temp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `finger_id` (`finger_id`,`attendan_date`,`Punch`);

--
-- Indexes for table `emp_education`
--
ALTER TABLE `emp_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_language`
--
ALTER TABLE `emp_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_licence`
--
ALTER TABLE `emp_licence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_overtime`
--
ALTER TABLE `emp_overtime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_vacations`
--
ALTER TABLE `emp_vacations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_weekends`
--
ALTER TABLE `emp_weekends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_employee1_idx` (`add_by`),
  ADD KEY `fk_files_employee2_idx` (`approved_by`),
  ADD KEY `fk_files_project_folders1_idx` (`folder_id`),
  ADD KEY `fk_files_files_cat1_idx` (`cat_id`);

--
-- Indexes for table `files_cat`
--
ALTER TABLE `files_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupshift`
--
ALTER TABLE `groupshift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrsettings`
--
ALTER TABLE `hrsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `immigration`
--
ALTER TABLE `immigration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `late_ranges`
--
ALTER TABLE `late_ranges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licence`
--
ALTER TABLE `licence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `notify_approve`
--
ALTER TABLE `notify_approve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project_notify_approve_employee1_idx` (`emp_id`),
  ADD KEY `fk_project_notify_approve_projects1_idx` (`project_id`),
  ADD KEY `fk_notify_approve_project_folders1_idx` (`folder_id`);

--
-- Indexes for table `notify_list`
--
ALTER TABLE `notify_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notify_list_files1_idx` (`file_id`),
  ADD KEY `fk_notify_list_employee1_idx` (`emp_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_ids`
--
ALTER TABLE `player_ids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_ids_employee_id_index` (`employee_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_name` (`project_name`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `project_folders`
--
ALTER TABLE `project_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project_folders_projects1_idx` (`project_id`);

--
-- Indexes for table `project_report_achieves`
--
ALTER TABLE `project_report_achieves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_team`
--
ALTER TABLE `project_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `project_team_permission`
--
ALTER TABLE `project_team_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_team_transaction`
--
ALTER TABLE `project_team_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_case_id` (`test_case_id`),
  ADD KEY `story_id` (`story_id`);

--
-- Indexes for table `run_attributes`
--
ALTER TABLE `run_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaryadd`
--
ALTER TABLE `salaryadd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaryaddtypes`
--
ALTER TABLE `salaryaddtypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salarycomponent`
--
ALTER TABLE `salarycomponent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_emp`
--
ALTER TABLE `salary_emp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_emp_details`
--
ALTER TABLE `salary_emp_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shared_attributes`
--
ALTER TABLE `shared_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `milestone_id` (`milestone_id`),
  ADD KEY `task_type_id` (`task_type_id`),
  ADD KEY `run_id` (`run_id`),
  ADD KEY `responsible_id` (`responsible_id`),
  ADD KEY `task_status_id` (`task_status_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `start` (`start`),
  ADD KEY `end` (`end`);

--
-- Indexes for table `tasks_comments`
--
ALTER TABLE `tasks_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks_files`
--
ALTER TABLE `tasks_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks_followers`
--
ALTER TABLE `tasks_followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `tasks_type`
--
ALTER TABLE `tasks_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_statuses`
--
ALTER TABLE `task_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_cases`
--
ALTER TABLE `test_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `title` (`title`(191)),
  ADD KEY `is_blocked` (`is_blocked`);

--
-- Indexes for table `test_case_story`
--
ALTER TABLE `test_case_story`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacationsbalance`
--
ALTER TABLE `vacationsbalance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacationsperiod`
--
ALTER TABLE `vacationsperiod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weekend`
--
ALTER TABLE `weekend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wikis`
--
ALTER TABLE `wikis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absent_permissions`
--
ALTER TABLE `absent_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attend_device`
--
ALTER TABLE `attend_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backlogs`
--
ALTER TABLE `backlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data22`
--
ALTER TABLE `data22`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit`
--
ALTER TABLE `debit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debitsettings`
--
ALTER TABLE `debitsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debittype`
--
ALTER TABLE `debittype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `default_folders`
--
ALTER TABLE `default_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empcomponent`
--
ALTER TABLE `empcomponent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=760;

--
-- AUTO_INCREMENT for table `employee_permission`
--
ALTER TABLE `employee_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2897;

--
-- AUTO_INCREMENT for table `employee_points`
--
ALTER TABLE `employee_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_attendance_temp`
--
ALTER TABLE `emp_attendance_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_education`
--
ALTER TABLE `emp_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_language`
--
ALTER TABLE `emp_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_licence`
--
ALTER TABLE `emp_licence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_overtime`
--
ALTER TABLE `emp_overtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_vacations`
--
ALTER TABLE `emp_vacations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_weekends`
--
ALTER TABLE `emp_weekends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files_cat`
--
ALTER TABLE `files_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groupshift`
--
ALTER TABLE `groupshift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrsettings`
--
ALTER TABLE `hrsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `late_ranges`
--
ALTER TABLE `late_ranges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `licence`
--
ALTER TABLE `licence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `notify_approve`
--
ALTER TABLE `notify_approve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notify_list`
--
ALTER TABLE `notify_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `player_ids`
--
ALTER TABLE `player_ids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `project_folders`
--
ALTER TABLE `project_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_report_achieves`
--
ALTER TABLE `project_report_achieves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_team`
--
ALTER TABLE `project_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `project_team_permission`
--
ALTER TABLE `project_team_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `project_team_transaction`
--
ALTER TABLE `project_team_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `run_attributes`
--
ALTER TABLE `run_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salaryadd`
--
ALTER TABLE `salaryadd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salaryaddtypes`
--
ALTER TABLE `salaryaddtypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salarycomponent`
--
ALTER TABLE `salarycomponent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_emp`
--
ALTER TABLE `salary_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_emp_details`
--
ALTER TABLE `salary_emp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shared_attributes`
--
ALTER TABLE `shared_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_comments`
--
ALTER TABLE `tasks_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_files`
--
ALTER TABLE `tasks_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_followers`
--
ALTER TABLE `tasks_followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_type`
--
ALTER TABLE `tasks_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task_statuses`
--
ALTER TABLE `task_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `test_cases`
--
ALTER TABLE `test_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_case_story`
--
ALTER TABLE `test_case_story`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacationsbalance`
--
ALTER TABLE `vacationsbalance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacationsperiod`
--
ALTER TABLE `vacationsperiod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weekend`
--
ALTER TABLE `weekend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wikis`
--
ALTER TABLE `wikis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
