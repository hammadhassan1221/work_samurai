import 'package:provider/provider.dart';
import 'package:work_samurai/screens/app_settings/app_settings_provider.dart';
import 'package:work_samurai/screens/card_details/card_details_provider.dart';
import 'package:work_samurai/screens/chat/chat_providers.dart';
import 'package:work_samurai/screens/documents/documents_provider.dart';
import 'package:work_samurai/screens/earning_details/earning_details_provider.dart';
import 'package:work_samurai/screens/earnings/earnings_providers.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile_provider.dart';
import 'package:work_samurai/screens/forget_password/forget_password_provider.dart';
import 'package:work_samurai/screens/job_roles/job_roles_providers.dart';
import 'package:work_samurai/screens/location_details/location_details_providers.dart';
import 'package:work_samurai/screens/login/login_providers.dart';
import 'package:work_samurai/screens/password/password_providers.dart';
import 'package:work_samurai/screens/settings/settings_provider.dart';
import 'package:work_samurai/screens/sign_up/sign_up_providers.dart';
import 'package:work_samurai/screens/splash/splash_providers.dart';
import 'package:work_samurai/screens/support/support_providers.dart';
import 'package:work_samurai/screens/update_documents/update_document_providers.dart';
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts_provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_provider.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages_provider.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/archive/archive_providers.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/completed/complete_providers.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';

final multiProviders=[
  ChangeNotifierProvider<SplashProvider>(
      create: (_) => SplashProvider(),
      lazy: true,
    ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WorkerProvider>(
    create: (_) => WorkerProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignUpProvider>(
    create: (_) => SignUpProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<GigsProvider>(
    create: (_) => GigsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgetPasswordProvider>(
    create: (_) => ForgetPasswordProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<AppSettingsProviders>(
    create: (_) => AppSettingsProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<CardDetailsProvider>(
    create: (_) => CardDetailsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ChatProviders>(
    create: (_) => ChatProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<DocumentProviders>(
    create: (_) => DocumentProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<EarningProviders>(
    create: (_) => EarningProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<EarningDetailsProviders>(
    create: (_) => EarningDetailsProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<EditProfileProviders>(
    create: (_) => EditProfileProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<UpdateDocumentProviders>(
    create: (_) => UpdateDocumentProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<AccountProviders>(
    create: (_) => AccountProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<AlertProviders>(
    create: (_) => AlertProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<MessageProviders>(
    create: (_) => MessageProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<ScheduleProviders>(
    create: (_) => ScheduleProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<SettingsProviders>(
    create: (_) => SettingsProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<PasswordProviders>(
    create: (_) => PasswordProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<JobRolesProviders>(
    create: (_) => JobRolesProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<LocationDetailsProviders>(
    create: (_) => LocationDetailsProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<CompleteProviders>(
    create: (_) => CompleteProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<ArchiveProviders>(
    create: (_) => ArchiveProviders(),
    lazy: true,
  ),
  ChangeNotifierProvider<SupportProviders>(
    create: (_) => SupportProviders(),
    lazy: true,
  ),
];