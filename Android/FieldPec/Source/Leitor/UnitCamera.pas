unit UnitCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls,FMX.Layouts
  {$IFDEF ANDROID}
    ,FMX.Android.Permissions
    ,FMX.CodeReader
   {$ENDIF};

type
  TFrmCamera = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    Label1: TLabel;
    btnCloseAll: TImage;
    procedure CodeReader1CodeReady(aCode: string);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    {$IFDEF ANDROID}
     CodeReader1        : TCodeReader;
     AndroidPermissions1: TAndroidPermissions;
    {$ENDIF}
    codigo : string;
  end;

var
  FrmCamera: TFrmCamera;

implementation

{$R *.fmx}

procedure TFrmCamera.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmCamera.btnVoltarClick(Sender: TObject);
begin
 Close;
end;
procedure TFrmCamera.CodeReader1CodeReady(aCode: string);
begin
  codigo := aCode;
 if codigo.Length>0 then
    Close
end;
procedure TFrmCamera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 {$IFDEF ANDROID}
  CodeReader1.Stop;
 {$ENDIF};
end;

procedure TFrmCamera.FormCreate(Sender: TObject);
begin
 {$IFDEF ANDROID}
   AndroidPermissions1:= TAndroidPermissions.Create(self);
  with AndroidPermissions1 do
  begin
    AutoRequestPermissions := True;
    DisplayHeader := 'O aplicativo precisa de permiss'#245'es para:';
    PermissionsRequired.ACCESS_CHECKIN_PROPERTIES := False;
    PermissionsRequired.ACCESS_COARSE_LOCATION := False;
    PermissionsRequired.ACCESS_FINE_LOCATION := False;
    PermissionsRequired.ACCESS_LOCATION_EXTRA_COMMANDS := False;
    PermissionsRequired.ACCESS_NETWORK_STATE := False;
    PermissionsRequired.ACCESS_NOTIFICATION_POLICY := False;
    PermissionsRequired.ACCESS_WIFI_STATE := False;
    PermissionsRequired.ACCOUNT_MANAGER := False;
    PermissionsRequired.ADD_VOICEMAIL := False;
    PermissionsRequired.ANSWER_PHONE_CALLS := False;
    PermissionsRequired.BATTERY_STATS := False      ;
    PermissionsRequired.BIND_ACCESSIBILITY_SERVICE :=False;
    PermissionsRequired.BIND_APPWIDGET := False;
    PermissionsRequired.BIND_AUTOFILL_SERVICE := False;
    PermissionsRequired.BIND_CARRIER_MESSAGING_SERVICE := False;
    PermissionsRequired.BIND_CARRIER_SERVICES := False;
    PermissionsRequired.BIND_CHOOSER_TARGET_SERVICE := False;
    PermissionsRequired.BIND_CONDITION_PROVIDER_SERVICE := False;
    PermissionsRequired.BIND_DEVICE_ADMIN := False;
    PermissionsRequired.BIND_DREAM_SERVICE := False;
    PermissionsRequired.BIND_INCALL_SERVICE := False;
    PermissionsRequired.BIND_INPUT_METHOD := False;
    PermissionsRequired.BIND_MIDI_DEVICE_SERVICE := False;
    PermissionsRequired.BIND_NFC_SERVICE := False;
    PermissionsRequired.BIND_NOTIFICATION_LISTENER_SERVICE := False;
    PermissionsRequired.BIND_PRINT_SERVICE := False;
    PermissionsRequired.BIND_QUICK_SETTINGS_TILE := False;
    PermissionsRequired.BIND_REMOTEVIEWS := False;
    PermissionsRequired.BIND_SCREENING_SERVICE := False;
    PermissionsRequired.BIND_TELECOM_CONNECTION_SERVICE := False;
    PermissionsRequired.BIND_TEXT_SERVICE := False;
    PermissionsRequired.BIND_TV_INPUT := False;
    PermissionsRequired.BIND_VISUAL_VOICEMAIL_SERVICE := False;
    PermissionsRequired.BIND_VOICE_INTERACTION := False;
    PermissionsRequired.BIND_VPN_SERVICE := False;
    PermissionsRequired.BIND_VR_LISTENER_SERVICE := False;
    PermissionsRequired.BIND_WALLPAPER := False;
    PermissionsRequired.BLUETOOTH := False;
    PermissionsRequired.BLUETOOTH_ADMIN := False;
    PermissionsRequired.BLUETOOTH_PRIVILEGED := False;
    PermissionsRequired.BODY_SENSORS := False;
    PermissionsRequired.BROADCAST_PACKAGE_REMOVED := False;
    PermissionsRequired.BROADCAST_SMS := False;
    PermissionsRequired.BROADCAST_STICKY := False;
    PermissionsRequired.BROADCAST_WAP_PUSH := False;
    PermissionsRequired.CALL_PHONE := False;
    PermissionsRequired.CALL_PRIVILEGED := False;
    PermissionsRequired.CAMERA := True;
    PermissionsRequired.CAPTURE_AUDIO_OUTPUT := False;
    PermissionsRequired.CAPTURE_SECURE_VIDEO_OUTPUT := False;
    PermissionsRequired.CAPTURE_VIDEO_OUTPUT := False;
    PermissionsRequired.CHANGE_COMPONENT_ENABLED_STATE := False;
    PermissionsRequired.CHANGE_CONFIGURATION := False;
    PermissionsRequired.CHANGE_NETWORK_STATE := False;
    PermissionsRequired.CHANGE_WIFI_MULTICAST_STATE := False;
    PermissionsRequired.CHANGE_WIFI_STATE := False;
    PermissionsRequired.CLEAR_APP_CACHE := False;
    PermissionsRequired.CONTROL_LOCATION_UPDATES := False;
    PermissionsRequired.DELETE_CACHE_FILES := False;
    PermissionsRequired.DELETE_PACKAGES := False;
    PermissionsRequired.DIAGNOSTIC := False;
    PermissionsRequired.DISABLE_KEYGUARD := False;
    PermissionsRequired.DUMP := False;
    PermissionsRequired.EXPAND_STATUS_BAR := False;
    PermissionsRequired.FACTORY_TEST := False;
    PermissionsRequired.GET_ACCOUNTS := False;
    PermissionsRequired.GET_ACCOUNTS_PRIVILEGED := False;
    PermissionsRequired.GET_PACKAGE_SIZE := False;
    PermissionsRequired.GET_TASKS := False;
    PermissionsRequired.GLOBAL_SEARCH := False;
    PermissionsRequired.INSTALL_LOCATION_PROVIDER := False;
    PermissionsRequired.INSTALL_PACKAGES := False;
    PermissionsRequired.INSTALL_SHORTCUT := False;
    PermissionsRequired.INSTANT_APP_FOREGROUND_SERVICE := False;
    PermissionsRequired.INTERNET := False;
    PermissionsRequired.KILL_BACKGROUND_PROCESSES := False;
    PermissionsRequired.LOCATION_HARDWARE := False;
    PermissionsRequired.MANAGE_DOCUMENTS := False;
    PermissionsRequired.MANAGE_OWN_CALLS := False;
    PermissionsRequired.MASTER_CLEAR := False;
    PermissionsRequired.MEDIA_CONTENT_CONTROL := False;
    PermissionsRequired.MODIFY_AUDIO_SETTINGS := False;
    PermissionsRequired.MODIFY_PHONE_STATE := False;
    PermissionsRequired.MOUNT_FORMAT_FILESYSTEMS := False;
    PermissionsRequired.MOUNT_UNMOUNT_FILESYSTEMS := False;
    PermissionsRequired.NFC := False;
    PermissionsRequired.PACKAGE_USAGE_STATS := False;
    PermissionsRequired.PERSISTENT_ACTIVITY := False;
    PermissionsRequired.PROCESS_OUTGOING_CALLS := False;
    PermissionsRequired.READ_CALENDAR := False;
    PermissionsRequired.READ_CALL_LOG := False;
    PermissionsRequired.READ_CONTACTS := False;
    PermissionsRequired.READ_EXTERNAL_STORAGE := False;
    PermissionsRequired.READ_FRAME_BUFFER := False;
    PermissionsRequired.READ_INPUT_STATE := False;
    PermissionsRequired.READ_LOGS := False;
    PermissionsRequired.READ_PHONE_NUMBERS := False;
    PermissionsRequired.READ_PHONE_STATE := False;
    PermissionsRequired.READ_SMS := False;
    PermissionsRequired.READ_SYNC_SETTINGS := False;
    PermissionsRequired.READ_SYNC_STATS := False;
    PermissionsRequired.READ_VOICEMAIL := False;
    PermissionsRequired.REBOOT := False;
    PermissionsRequired.RECEIVE_BOOT_COMPLETED := False;
    PermissionsRequired.RECEIVE_MMS := False;
    PermissionsRequired.RECEIVE_SMS := False;
    PermissionsRequired.RECEIVE_WAP_PUSH := False;
    PermissionsRequired.RECORD_AUDIO := False;
    PermissionsRequired.REORDER_TASKS := False;
    PermissionsRequired.REQUEST_COMPANION_RUN_IN_BACKGROUND := False;
    PermissionsRequired.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND := False;
    PermissionsRequired.REQUEST_DELETE_PACKAGES := False;
    PermissionsRequired.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS := False;
    PermissionsRequired.REQUEST_INSTALL_PACKAGES := False;
    PermissionsRequired.RESTART_PACKAGES := False;
    PermissionsRequired.SEND_RESPOND_VIA_MESSAGE := False;
    PermissionsRequired.SEND_SMS := False;
    PermissionsRequired.SET_ALARM := False;
    PermissionsRequired.SET_ALWAYS_FINISH := False;
    PermissionsRequired.SET_ANIMATION_SCALE := False;
    PermissionsRequired.SET_DEBUG_APP := False;
    PermissionsRequired.SET_PREFERRED_APPLICATIONS := False;
    PermissionsRequired.SET_PROCESS_LIMIT := False;
    PermissionsRequired.SET_TIME := False;
    PermissionsRequired.SET_TIME_ZONE := False;
    PermissionsRequired.SET_WALLPAPER := False;
    PermissionsRequired.SET_WALLPAPER_HINTS := False;
    PermissionsRequired.SIGNAL_PERSISTENT_PROCESSES := False;
    PermissionsRequired.STATUS_BAR := False;
    PermissionsRequired.SYSTEM_ALERT_WINDOW := False;
    PermissionsRequired.TRANSMIT_IR := False;
    PermissionsRequired.UNINSTALL_SHORTCUT := False;
    PermissionsRequired.UPDATE_DEVICE_STATS := False;
    PermissionsRequired.USE_FINGERPRINT := False;
    PermissionsRequired.USE_BIOMETRIC := False;
    PermissionsRequired.USE_SIP := False;
    PermissionsRequired.VIBRATE := False;
    PermissionsRequired.WAKE_LOCK := False;
    PermissionsRequired.WRITE_APN_SETTINGS := False;
    PermissionsRequired.WRITE_CALENDAR := False;
    PermissionsRequired.WRITE_CALL_LOG := False;
    PermissionsRequired.WRITE_CONTACTS := False;
    PermissionsRequired.WRITE_EXTERNAL_STORAGE := False;
    PermissionsRequired.WRITE_GSERVICES := False;
    PermissionsRequired.WRITE_SECURE_SETTINGS := False;
    PermissionsRequired.WRITE_SETTINGS := False;
    PermissionsRequired.WRITE_SYNC_SETTINGS := False;
    PermissionsRequired.WRITE_VOICEMAIL := False;
  end;



   CodeReader1     := TCodeReader.Create(self);
   with CodeReader1 do
   begin
    CodeType := Code2D;
    ShowMask := True;
    ShowIconTypes := True;
    PlaySound := True;
    BeepVolume := 1.000000000000000000;
    MaxImageWidth := 1000;
    ValidSamples := 2;
    OnCodeReady := CodeReader1CodeReady;
   end;
 {$ENDIF};
end;

procedure TFrmCamera.FormShow(Sender: TObject);
begin
 {$IFDEF ANDROID}
  CodeReader1.Start
 {$ENDIF};
end;
end.
