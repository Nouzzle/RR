; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [331 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [656 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 246
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 280
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 200
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 144
	i32 53857724, ; 9: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 294
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 196
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 98325684, ; 14: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 183
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 264
	i32 113429830, ; 16: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 324
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 264
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 20: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 284
	i32 142721839, ; 21: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 220
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 26: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 266
	i32 184328833, ; 27: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 28: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 323
	i32 199333315, ; 29: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 324
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 218
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 33: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 182
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 240
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 223
	i32 276479776, ; 40: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 242
	i32 280482487, ; 42: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 239
	i32 280992041, ; 43: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 295
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 291275502, ; 45: Microsoft.Extensions.Http.dll => 0x115c82ee => 184
	i32 298918909, ; 46: System.Net.Ping.dll => 0x11d123fd => 68
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 209
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 49: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 308
	i32 342366114, ; 50: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 241
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 307
	i32 357576608, ; 52: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 295
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 327
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 62: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 319
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 224
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 237
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 70: System.dll => 0x1bff388e => 163
	i32 474957582, ; 71: RateReel.dll => 0x1c4f470e => 0
	i32 476646585, ; 72: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 239
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 252
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 75: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 306
	i32 503918385, ; 76: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 300
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 190
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527168573, ; 79: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 303
	i32 527452488, ; 80: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 284
	i32 530272170, ; 81: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 82: Microsoft.Extensions.Logging => 0x20216150 => 185
	i32 540030774, ; 83: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 84: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 85: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 87: Jsr305Binding => 0x213954e7 => 277
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 275
	i32 572948994, ; 89: Moq.dll => 0x22268202 => 199
	i32 577335427, ; 90: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 91: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 314
	i32 597488923, ; 92: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 93: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 94: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 95: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 96: Xamarin.AndroidX.CustomView => 0x2568904f => 229
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 235
	i32 643868501, ; 98: System.Net => 0x2660a755 => 80
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 271
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 216
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 104: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 294
	i32 690569205, ; 105: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 106: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 286
	i32 693804605, ; 107: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 108: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 109: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 281
	i32 700358131, ; 110: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 111: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 309
	i32 709557578, ; 112: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 297
	i32 720511267, ; 113: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 285
	i32 722857257, ; 114: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 731701662, ; 115: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 189
	i32 735137430, ; 116: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 750365387, ; 117: xunit.core.dll => 0x2cb9aacb => 290
	i32 752232764, ; 118: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 119: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 206
	i32 759454413, ; 120: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 121: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 122: System.IO.Compression => 0x2e394f87 => 45
	i32 789151979, ; 123: Microsoft.Extensions.Options => 0x2f0980eb => 188
	i32 790371945, ; 124: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 230
	i32 804715423, ; 125: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 126: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 244
	i32 823281589, ; 127: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 128: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 129: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 131: Xamarin.AndroidX.Print => 0x3246f6cd => 257
	i32 870878177, ; 132: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 293
	i32 873119928, ; 133: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 134: System.Globalization.dll => 0x34505120 => 41
	i32 878688458, ; 135: RateReel => 0x345fb8ca => 0
	i32 878954865, ; 136: System.Net.Http.Json => 0x3463c971 => 62
	i32 904024072, ; 137: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 138: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 139: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 321
	i32 928116545, ; 140: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 280
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 955402788, ; 142: Newtonsoft.Json => 0x38f24a24 => 200
	i32 956575887, ; 143: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 285
	i32 966729478, ; 144: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 278
	i32 967690846, ; 145: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 241
	i32 975236339, ; 146: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 147: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 148: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 149: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 150: System.Collections.dll => 0x3b2c715c => 12
	i32 993161700, ; 151: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 325
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 994547685, ; 153: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 299
	i32 1001831731, ; 154: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 155: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 261
	i32 1019214401, ; 156: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 157: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1029334545, ; 158: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 296
	i32 1031528504, ; 159: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 279
	i32 1035644815, ; 160: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 214
	i32 1036536393, ; 161: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 162: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1048992957, ; 163: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 183
	i32 1052210849, ; 164: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 248
	i32 1067306892, ; 165: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 166: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 167: Xamarin.Kotlin.StdLib => 0x409e66d8 => 282
	i32 1089913930, ; 168: System.Diagnostics.EventLog.dll => 0x40f6c44a => 204
	i32 1098259244, ; 169: System => 0x41761b2c => 163
	i32 1109435305, ; 170: xunit.execution.dotnet.dll => 0x4220a3a9 => 291
	i32 1111289522, ; 171: DnsClient.dll => 0x423ceeb2 => 175
	i32 1121599056, ; 172: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 247
	i32 1127624469, ; 173: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 187
	i32 1149092582, ; 174: Xamarin.AndroidX.Window => 0x447dc2e6 => 274
	i32 1170634674, ; 175: System.Web.dll => 0x45c677b2 => 152
	i32 1175144683, ; 176: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 270
	i32 1178241025, ; 177: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 255
	i32 1178797549, ; 178: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 300
	i32 1203215381, ; 179: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 313
	i32 1204270330, ; 180: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 216
	i32 1208641965, ; 181: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1211243070, ; 182: xunit.assert => 0x48321a3e => 289
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 184: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 311
	i32 1243150071, ; 185: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 275
	i32 1253011324, ; 186: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1264511973, ; 187: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 265
	i32 1267360935, ; 188: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 269
	i32 1273260888, ; 189: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 221
	i32 1275534314, ; 190: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 286
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 213
	i32 1287719757, ; 192: xunit.execution.dotnet => 0x4cc10b4d => 291
	i32 1293217323, ; 193: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 232
	i32 1309188875, ; 194: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 195: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 274
	i32 1324164729, ; 196: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 197: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 198: System.IO => 0x514d38cd => 56
	i32 1376866003, ; 199: Xamarin.AndroidX.SavedState => 0x52114ed3 => 261
	i32 1379779777, ; 200: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1391893274, ; 201: MongoDB.Bson.dll => 0x52f69b1a => 197
	i32 1402170036, ; 202: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 203: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 225
	i32 1408764838, ; 204: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 205: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 206: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1434145427, ; 207: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 208: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 278
	i32 1439761251, ; 209: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 210: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 211: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 212: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 213: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461234159, ; 214: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 215: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 216: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 217: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 215
	i32 1470490898, ; 218: Microsoft.Extensions.Primitives => 0x57a5e912 => 190
	i32 1479771757, ; 219: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 220: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 221: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 222: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 262
	i32 1493001747, ; 223: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 303
	i32 1505131794, ; 224: Microsoft.Extensions.Http => 0x59b67d12 => 184
	i32 1514721132, ; 225: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 298
	i32 1536373174, ; 226: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 227: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 228: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 229: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 230: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 318
	i32 1554762148, ; 231: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 301
	i32 1565862583, ; 232: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 233: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 234: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 235: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1580413037, ; 236: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 319
	i32 1582372066, ; 237: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 231
	i32 1591080825, ; 238: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 326
	i32 1592978981, ; 239: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 240: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 279
	i32 1601112923, ; 241: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1604827217, ; 242: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 243: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 244: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 251
	i32 1622358360, ; 245: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 246: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 273
	i32 1634654947, ; 247: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 248: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 235
	i32 1636350590, ; 249: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 228
	i32 1639515021, ; 250: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 251: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 252: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 253: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 254: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 267
	i32 1658251792, ; 255: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 276
	i32 1670060433, ; 256: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 223
	i32 1675553242, ; 257: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 258: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 259: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 260: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 261: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 262: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 263: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 283
	i32 1701541528, ; 264: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 265: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 244
	i32 1726116996, ; 266: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 267: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 268: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 219
	i32 1736233607, ; 269: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 316
	i32 1744735666, ; 270: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746316138, ; 271: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 272: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 273: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 274: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 275: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 276: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 266
	i32 1770582343, ; 277: Microsoft.Extensions.Logging.dll => 0x6988f147 => 185
	i32 1776026572, ; 278: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 279: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 280: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1788241197, ; 281: Xamarin.AndroidX.Fragment => 0x6a96652d => 237
	i32 1807397336, ; 282: MongoDB.Driver => 0x6bbab1d8 => 198
	i32 1808609942, ; 283: Xamarin.AndroidX.Loader => 0x6bcd3296 => 251
	i32 1809966115, ; 284: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 311
	i32 1813058853, ; 285: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 282
	i32 1813201214, ; 286: Xamarin.Google.Android.Material => 0x6c13413e => 276
	i32 1818569960, ; 287: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 256
	i32 1818787751, ; 288: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1821794637, ; 289: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 305
	i32 1824175904, ; 290: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 291: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 292: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 186
	i32 1835989518, ; 293: Snappier => 0x6d6efa0e => 202
	i32 1842015223, ; 294: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 322
	i32 1847515442, ; 295: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 206
	i32 1858542181, ; 296: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 297: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1879696579, ; 298: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1881913493, ; 299: xunit.assert.dll => 0x702bb895 => 289
	i32 1885316902, ; 300: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 217
	i32 1888955245, ; 301: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 302: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 303: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 304: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 305: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 306: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1949863139, ; 307: Castle.Core.dll => 0x74388ce3 => 172
	i32 1956758971, ; 308: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1960264639, ; 309: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 308
	i32 1961813231, ; 310: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 263
	i32 1968388702, ; 311: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 312: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 283
	i32 1985761444, ; 313: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 208
	i32 1994201121, ; 314: Moq => 0x76dd1821 => 199
	i32 2011961780, ; 315: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014344398, ; 316: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 304
	i32 2019465201, ; 317: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 248
	i32 2025202353, ; 318: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 293
	i32 2031763787, ; 319: Xamarin.Android.Glide => 0x791a414b => 205
	i32 2043674646, ; 320: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 307
	i32 2045470958, ; 321: System.Private.Xml => 0x79eb68ee => 87
	i32 2048278909, ; 322: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 179
	i32 2055257422, ; 323: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 243
	i32 2060060697, ; 324: System.Windows.dll => 0x7aca0819 => 153
	i32 2070888862, ; 325: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 326: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 327: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2127167465, ; 328: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 329: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 330: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 331: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2150663486, ; 332: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 309
	i32 2159891885, ; 333: Microsoft.Maui => 0x80bd55ad => 194
	i32 2165051842, ; 334: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 316
	i32 2181898931, ; 335: Microsoft.Extensions.Options.dll => 0x820d22b3 => 188
	i32 2192057212, ; 336: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 186
	i32 2193016926, ; 337: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 338: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 287
	i32 2201231467, ; 339: System.Net.Http => 0x8334206b => 63
	i32 2217644978, ; 340: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 270
	i32 2222056684, ; 341: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 342: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 252
	i32 2252106437, ; 343: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2256313426, ; 344: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 345: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 346: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 347: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 207
	i32 2270573516, ; 348: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 301
	i32 2279755925, ; 349: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 259
	i32 2289298199, ; 350: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 320
	i32 2290594010, ; 351: SharpCompress.dll => 0x8887b0da => 201
	i32 2293034957, ; 352: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 353: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 354: System.Net.Mail => 0x88ffe49e => 65
	i32 2305521784, ; 355: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 356: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 211
	i32 2320631194, ; 357: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2340441535, ; 358: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 359: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 360: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 361: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2369760409, ; 362: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 321
	i32 2371007202, ; 363: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 364: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 365: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2401565422, ; 366: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403452196, ; 367: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 234
	i32 2421380589, ; 368: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2421992093, ; 369: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 312
	i32 2423080555, ; 370: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 221
	i32 2435356389, ; 371: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 372: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 373: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 374: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 375: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 376: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 224
	i32 2471841756, ; 377: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 378: Java.Interop.dll => 0x93918882 => 167
	i32 2478591493, ; 379: xunit.core => 0x93bc4e05 => 290
	i32 2480646305, ; 380: Microsoft.Maui.Controls => 0x93dba8a1 => 192
	i32 2483903535, ; 381: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 382: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 383: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 384: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 246
	i32 2509217888, ; 386: System.Diagnostics.EventLog => 0x958fa060 => 204
	i32 2520433370, ; 387: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 318
	i32 2522472828, ; 388: Xamarin.Android.Glide.dll => 0x9659e17c => 205
	i32 2538310050, ; 389: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2562349572, ; 390: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 391: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2581783588, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 247
	i32 2581819634, ; 393: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 269
	i32 2585220780, ; 394: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 395: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2605712449, ; 397: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 287
	i32 2611359322, ; 398: ZstdSharp.dll => 0x9ba62e5a => 292
	i32 2615233544, ; 399: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 238
	i32 2616218305, ; 400: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 187
	i32 2617129537, ; 401: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 402: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 403: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 228
	i32 2624644809, ; 404: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 233
	i32 2627185994, ; 405: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 406: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 407: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 242
	i32 2663391936, ; 408: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 207
	i32 2663698177, ; 409: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 410: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 411: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 412: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 413: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 414: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 415: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 267
	i32 2715334215, ; 416: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 417: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 418: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 419: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2725980451, ; 420: SharpCompress => 0xa27b2923 => 201
	i32 2732626843, ; 421: Xamarin.AndroidX.Activity => 0xa2e0939b => 209
	i32 2735172069, ; 422: System.Threading.Channels => 0xa30769e5 => 138
	i32 2737747696, ; 423: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 215
	i32 2740948882, ; 424: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 425: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2758225723, ; 426: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 193
	i32 2764765095, ; 427: Microsoft.Maui.dll => 0xa4caf7a7 => 194
	i32 2765824710, ; 428: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 429: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 281
	i32 2778768386, ; 430: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 272
	i32 2779977773, ; 431: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 260
	i32 2788224221, ; 432: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 238
	i32 2801831435, ; 433: Microsoft.Maui.Graphics => 0xa7008e0b => 196
	i32 2802068195, ; 434: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 322
	i32 2803228030, ; 435: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2806116107, ; 436: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 299
	i32 2810250172, ; 437: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 225
	i32 2819470561, ; 438: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 439: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 440: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 260
	i32 2824502124, ; 441: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 442: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 312
	i32 2838993487, ; 443: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 249
	i32 2849599387, ; 444: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 445: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 272
	i32 2855708567, ; 446: Xamarin.AndroidX.Transition => 0xaa36a797 => 268
	i32 2857259519, ; 447: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 298
	i32 2861098320, ; 448: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 449: Microsoft.Maui.Essentials => 0xaa8a4878 => 195
	i32 2868488919, ; 450: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 451: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 210
	i32 2875164099, ; 452: Jsr305Binding.dll => 0xab5f85c3 => 277
	i32 2875220617, ; 453: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2883495834, ; 454: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 317
	i32 2884993177, ; 455: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 236
	i32 2887636118, ; 456: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 457: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 458: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 459: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 460: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 461: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2916838712, ; 462: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 273
	i32 2919462931, ; 463: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 464: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 212
	i32 2936416060, ; 465: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 466: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 467: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 468: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 469: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2971004615, ; 470: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 189
	i32 2972252294, ; 471: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 472: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 232
	i32 2987532451, ; 473: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 263
	i32 2996846495, ; 474: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 245
	i32 3008580042, ; 475: xunit.abstractions.dll => 0xb35349ca => 288
	i32 3016983068, ; 476: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 265
	i32 3020703001, ; 477: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 182
	i32 3023353419, ; 478: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 479: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 240
	i32 3038032645, ; 480: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 327
	i32 3056245963, ; 481: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 262
	i32 3057625584, ; 482: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 253
	i32 3059408633, ; 483: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 484: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 485: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 486: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 305
	i32 3089219899, ; 487: ZstdSharp => 0xb821c13b => 292
	i32 3090735792, ; 488: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 489: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 490: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 491: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 492: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 493: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 494: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 495: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 496: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 497: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 498: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3173064269, ; 499: DnsClient => 0xbd211e4d => 175
	i32 3178803400, ; 500: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 254
	i32 3192346100, ; 501: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 502: System.Web => 0xbe592c0c => 152
	i32 3204380047, ; 503: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 504: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 505: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 231
	i32 3220365878, ; 506: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 507: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 508: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3252856589, ; 509: MongoDB.Driver.dll => 0xc1e2a70d => 198
	i32 3258312781, ; 510: Xamarin.AndroidX.CardView => 0xc235e84d => 219
	i32 3258876633, ; 511: MongoDB.Bson => 0xc23e82d9 => 197
	i32 3265493905, ; 512: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 513: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 514: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 515: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 516: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 517: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 518: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 519: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3316684772, ; 520: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 521: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 229
	i32 3317144872, ; 522: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 523: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 217
	i32 3345895724, ; 524: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 258
	i32 3346324047, ; 525: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 255
	i32 3358260929, ; 526: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 527: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 210
	i32 3362522851, ; 528: Xamarin.AndroidX.Core => 0xc86c06e3 => 226
	i32 3366347497, ; 529: Java.Interop => 0xc8a662e9 => 167
	i32 3374999561, ; 530: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 259
	i32 3395150330, ; 531: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 532: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 533: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 230
	i32 3421170118, ; 534: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 179
	i32 3428513518, ; 535: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 536: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 537: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 538: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 233
	i32 3445260447, ; 539: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 540: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 191
	i32 3463511458, ; 541: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 304
	i32 3471940407, ; 542: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 543: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 544: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 317
	i32 3485117614, ; 545: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 546: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 547: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 222
	i32 3509114376, ; 548: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 549: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 550: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 551: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3542658132, ; 552: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 323
	i32 3560100363, ; 553: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 554: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3596930546, ; 555: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 297
	i32 3597029428, ; 556: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 208
	i32 3598340787, ; 557: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 558: System.Linq.dll => 0xd715a361 => 60
	i32 3623444314, ; 559: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 296
	i32 3624195450, ; 560: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 561: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 257
	i32 3633644679, ; 562: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 212
	i32 3638274909, ; 563: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 564: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 243
	i32 3643854240, ; 565: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 254
	i32 3645089577, ; 566: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3647796983, ; 567: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 314
	i32 3657292374, ; 568: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 569: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3662115805, ; 570: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 302
	i32 3672681054, ; 571: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3682565725, ; 572: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 218
	i32 3684561358, ; 573: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 222
	i32 3686075795, ; 574: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 310
	i32 3697841164, ; 575: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 326
	i32 3700866549, ; 576: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 577: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 227
	i32 3716563718, ; 578: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 579: Xamarin.AndroidX.Annotation => 0xdda814c6 => 211
	i32 3724971120, ; 580: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 253
	i32 3732100267, ; 581: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 582: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 583: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 203
	i32 3751444290, ; 584: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3786282454, ; 585: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 220
	i32 3791210109, ; 586: Snappier.dll => 0xe1f9467d => 202
	i32 3792276235, ; 587: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 588: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 191
	i32 3802395368, ; 589: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 590: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 591: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 592: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 593: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 594: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 595: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 596: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 597: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 598: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 599: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 600: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 601: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 268
	i32 3888767677, ; 602: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 258
	i32 3889960447, ; 603: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 325
	i32 3896106733, ; 604: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 605: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 226
	i32 3901907137, ; 606: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 607: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 608: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 271
	i32 3928044579, ; 609: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 610: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 611: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 256
	i32 3935049042, ; 612: xunit.abstractions => 0xea8c1552 => 288
	i32 3945713374, ; 613: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 614: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 615: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 214
	i32 3959773229, ; 616: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 245
	i32 3980434154, ; 617: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 320
	i32 3987592930, ; 618: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 302
	i32 4003436829, ; 619: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 620: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 213
	i32 4025784931, ; 621: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 622: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 193
	i32 4054681211, ; 623: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 624: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4070331268, ; 625: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 306
	i32 4073602200, ; 626: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4094352644, ; 627: Microsoft.Maui.Essentials.dll => 0xf40add04 => 195
	i32 4099507663, ; 628: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 629: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 630: Xamarin.AndroidX.Emoji2 => 0xf479582c => 234
	i32 4102112229, ; 631: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 315
	i32 4119206479, ; 632: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 313
	i32 4125707920, ; 633: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 310
	i32 4126470640, ; 634: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 635: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 636: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 637: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4151237749, ; 638: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 639: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 640: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 641: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 642: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 643: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 250
	i32 4185676441, ; 644: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 645: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 646: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 203
	i32 4234116406, ; 647: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 315
	i32 4241083455, ; 648: Castle.Core => 0xfcc9cc3f => 172
	i32 4256097574, ; 649: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 227
	i32 4258378803, ; 650: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 249
	i32 4260525087, ; 651: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 652: Microsoft.Maui.Controls.dll => 0xfea12dee => 192
	i32 4274976490, ; 653: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 654: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 250
	i32 4294763496 ; 655: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 236
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [656 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 246, ; 3
	i32 280, ; 4
	i32 47, ; 5
	i32 200, ; 6
	i32 79, ; 7
	i32 144, ; 8
	i32 294, ; 9
	i32 29, ; 10
	i32 123, ; 11
	i32 196, ; 12
	i32 101, ; 13
	i32 183, ; 14
	i32 264, ; 15
	i32 324, ; 16
	i32 106, ; 17
	i32 264, ; 18
	i32 138, ; 19
	i32 284, ; 20
	i32 76, ; 21
	i32 123, ; 22
	i32 13, ; 23
	i32 220, ; 24
	i32 131, ; 25
	i32 266, ; 26
	i32 150, ; 27
	i32 323, ; 28
	i32 324, ; 29
	i32 18, ; 30
	i32 218, ; 31
	i32 26, ; 32
	i32 182, ; 33
	i32 240, ; 34
	i32 1, ; 35
	i32 58, ; 36
	i32 41, ; 37
	i32 90, ; 38
	i32 223, ; 39
	i32 146, ; 40
	i32 242, ; 41
	i32 239, ; 42
	i32 295, ; 43
	i32 53, ; 44
	i32 184, ; 45
	i32 68, ; 46
	i32 209, ; 47
	i32 82, ; 48
	i32 308, ; 49
	i32 241, ; 50
	i32 307, ; 51
	i32 295, ; 52
	i32 130, ; 53
	i32 54, ; 54
	i32 148, ; 55
	i32 73, ; 56
	i32 144, ; 57
	i32 61, ; 58
	i32 145, ; 59
	i32 327, ; 60
	i32 164, ; 61
	i32 319, ; 62
	i32 224, ; 63
	i32 12, ; 64
	i32 237, ; 65
	i32 124, ; 66
	i32 151, ; 67
	i32 112, ; 68
	i32 165, ; 69
	i32 163, ; 70
	i32 0, ; 71
	i32 239, ; 72
	i32 252, ; 73
	i32 83, ; 74
	i32 306, ; 75
	i32 300, ; 76
	i32 190, ; 77
	i32 149, ; 78
	i32 303, ; 79
	i32 284, ; 80
	i32 59, ; 81
	i32 185, ; 82
	i32 50, ; 83
	i32 102, ; 84
	i32 113, ; 85
	i32 39, ; 86
	i32 277, ; 87
	i32 275, ; 88
	i32 199, ; 89
	i32 119, ; 90
	i32 314, ; 91
	i32 173, ; 92
	i32 51, ; 93
	i32 43, ; 94
	i32 118, ; 95
	i32 229, ; 96
	i32 235, ; 97
	i32 80, ; 98
	i32 135, ; 99
	i32 271, ; 100
	i32 216, ; 101
	i32 8, ; 102
	i32 72, ; 103
	i32 294, ; 104
	i32 154, ; 105
	i32 286, ; 106
	i32 153, ; 107
	i32 91, ; 108
	i32 281, ; 109
	i32 44, ; 110
	i32 309, ; 111
	i32 297, ; 112
	i32 285, ; 113
	i32 108, ; 114
	i32 189, ; 115
	i32 128, ; 116
	i32 290, ; 117
	i32 25, ; 118
	i32 206, ; 119
	i32 71, ; 120
	i32 54, ; 121
	i32 45, ; 122
	i32 188, ; 123
	i32 230, ; 124
	i32 22, ; 125
	i32 244, ; 126
	i32 85, ; 127
	i32 42, ; 128
	i32 159, ; 129
	i32 70, ; 130
	i32 257, ; 131
	i32 293, ; 132
	i32 3, ; 133
	i32 41, ; 134
	i32 0, ; 135
	i32 62, ; 136
	i32 16, ; 137
	i32 52, ; 138
	i32 321, ; 139
	i32 280, ; 140
	i32 104, ; 141
	i32 200, ; 142
	i32 285, ; 143
	i32 278, ; 144
	i32 241, ; 145
	i32 33, ; 146
	i32 157, ; 147
	i32 84, ; 148
	i32 31, ; 149
	i32 12, ; 150
	i32 325, ; 151
	i32 50, ; 152
	i32 299, ; 153
	i32 55, ; 154
	i32 261, ; 155
	i32 35, ; 156
	i32 181, ; 157
	i32 296, ; 158
	i32 279, ; 159
	i32 214, ; 160
	i32 34, ; 161
	i32 57, ; 162
	i32 183, ; 163
	i32 248, ; 164
	i32 176, ; 165
	i32 17, ; 166
	i32 282, ; 167
	i32 204, ; 168
	i32 163, ; 169
	i32 291, ; 170
	i32 175, ; 171
	i32 247, ; 172
	i32 187, ; 173
	i32 274, ; 174
	i32 152, ; 175
	i32 270, ; 176
	i32 255, ; 177
	i32 300, ; 178
	i32 313, ; 179
	i32 216, ; 180
	i32 28, ; 181
	i32 289, ; 182
	i32 51, ; 183
	i32 311, ; 184
	i32 275, ; 185
	i32 5, ; 186
	i32 265, ; 187
	i32 269, ; 188
	i32 221, ; 189
	i32 286, ; 190
	i32 213, ; 191
	i32 291, ; 192
	i32 232, ; 193
	i32 84, ; 194
	i32 274, ; 195
	i32 60, ; 196
	i32 111, ; 197
	i32 56, ; 198
	i32 261, ; 199
	i32 98, ; 200
	i32 197, ; 201
	i32 19, ; 202
	i32 225, ; 203
	i32 110, ; 204
	i32 100, ; 205
	i32 101, ; 206
	i32 103, ; 207
	i32 278, ; 208
	i32 70, ; 209
	i32 37, ; 210
	i32 31, ; 211
	i32 102, ; 212
	i32 72, ; 213
	i32 9, ; 214
	i32 122, ; 215
	i32 45, ; 216
	i32 215, ; 217
	i32 190, ; 218
	i32 9, ; 219
	i32 42, ; 220
	i32 4, ; 221
	i32 262, ; 222
	i32 303, ; 223
	i32 184, ; 224
	i32 298, ; 225
	i32 30, ; 226
	i32 137, ; 227
	i32 91, ; 228
	i32 92, ; 229
	i32 318, ; 230
	i32 301, ; 231
	i32 48, ; 232
	i32 140, ; 233
	i32 111, ; 234
	i32 139, ; 235
	i32 319, ; 236
	i32 231, ; 237
	i32 326, ; 238
	i32 114, ; 239
	i32 279, ; 240
	i32 156, ; 241
	i32 75, ; 242
	i32 78, ; 243
	i32 251, ; 244
	i32 36, ; 245
	i32 273, ; 246
	i32 174, ; 247
	i32 235, ; 248
	i32 228, ; 249
	i32 63, ; 250
	i32 137, ; 251
	i32 15, ; 252
	i32 115, ; 253
	i32 267, ; 254
	i32 276, ; 255
	i32 223, ; 256
	i32 47, ; 257
	i32 69, ; 258
	i32 79, ; 259
	i32 125, ; 260
	i32 93, ; 261
	i32 120, ; 262
	i32 283, ; 263
	i32 26, ; 264
	i32 244, ; 265
	i32 96, ; 266
	i32 27, ; 267
	i32 219, ; 268
	i32 316, ; 269
	i32 148, ; 270
	i32 168, ; 271
	i32 4, ; 272
	i32 97, ; 273
	i32 32, ; 274
	i32 92, ; 275
	i32 266, ; 276
	i32 185, ; 277
	i32 21, ; 278
	i32 40, ; 279
	i32 169, ; 280
	i32 237, ; 281
	i32 198, ; 282
	i32 251, ; 283
	i32 311, ; 284
	i32 282, ; 285
	i32 276, ; 286
	i32 256, ; 287
	i32 2, ; 288
	i32 305, ; 289
	i32 133, ; 290
	i32 110, ; 291
	i32 186, ; 292
	i32 202, ; 293
	i32 322, ; 294
	i32 206, ; 295
	i32 57, ; 296
	i32 94, ; 297
	i32 38, ; 298
	i32 289, ; 299
	i32 217, ; 300
	i32 25, ; 301
	i32 93, ; 302
	i32 88, ; 303
	i32 98, ; 304
	i32 10, ; 305
	i32 86, ; 306
	i32 172, ; 307
	i32 99, ; 308
	i32 308, ; 309
	i32 263, ; 310
	i32 177, ; 311
	i32 283, ; 312
	i32 208, ; 313
	i32 199, ; 314
	i32 7, ; 315
	i32 304, ; 316
	i32 248, ; 317
	i32 293, ; 318
	i32 205, ; 319
	i32 307, ; 320
	i32 87, ; 321
	i32 179, ; 322
	i32 243, ; 323
	i32 153, ; 324
	i32 32, ; 325
	i32 115, ; 326
	i32 81, ; 327
	i32 20, ; 328
	i32 11, ; 329
	i32 161, ; 330
	i32 3, ; 331
	i32 309, ; 332
	i32 194, ; 333
	i32 316, ; 334
	i32 188, ; 335
	i32 186, ; 336
	i32 83, ; 337
	i32 287, ; 338
	i32 63, ; 339
	i32 270, ; 340
	i32 142, ; 341
	i32 252, ; 342
	i32 156, ; 343
	i32 40, ; 344
	i32 116, ; 345
	i32 178, ; 346
	i32 207, ; 347
	i32 301, ; 348
	i32 259, ; 349
	i32 320, ; 350
	i32 201, ; 351
	i32 130, ; 352
	i32 74, ; 353
	i32 65, ; 354
	i32 171, ; 355
	i32 211, ; 356
	i32 142, ; 357
	i32 105, ; 358
	i32 150, ; 359
	i32 69, ; 360
	i32 155, ; 361
	i32 321, ; 362
	i32 177, ; 363
	i32 120, ; 364
	i32 126, ; 365
	i32 151, ; 366
	i32 234, ; 367
	i32 140, ; 368
	i32 312, ; 369
	i32 221, ; 370
	i32 20, ; 371
	i32 14, ; 372
	i32 134, ; 373
	i32 74, ; 374
	i32 58, ; 375
	i32 224, ; 376
	i32 166, ; 377
	i32 167, ; 378
	i32 290, ; 379
	i32 192, ; 380
	i32 15, ; 381
	i32 73, ; 382
	i32 6, ; 383
	i32 23, ; 384
	i32 246, ; 385
	i32 204, ; 386
	i32 318, ; 387
	i32 205, ; 388
	i32 90, ; 389
	i32 1, ; 390
	i32 135, ; 391
	i32 247, ; 392
	i32 269, ; 393
	i32 133, ; 394
	i32 68, ; 395
	i32 145, ; 396
	i32 287, ; 397
	i32 292, ; 398
	i32 238, ; 399
	i32 187, ; 400
	i32 87, ; 401
	i32 95, ; 402
	i32 228, ; 403
	i32 233, ; 404
	i32 30, ; 405
	i32 44, ; 406
	i32 242, ; 407
	i32 207, ; 408
	i32 108, ; 409
	i32 157, ; 410
	i32 34, ; 411
	i32 22, ; 412
	i32 113, ; 413
	i32 56, ; 414
	i32 267, ; 415
	i32 143, ; 416
	i32 117, ; 417
	i32 119, ; 418
	i32 109, ; 419
	i32 201, ; 420
	i32 209, ; 421
	i32 138, ; 422
	i32 215, ; 423
	i32 53, ; 424
	i32 104, ; 425
	i32 193, ; 426
	i32 194, ; 427
	i32 132, ; 428
	i32 281, ; 429
	i32 272, ; 430
	i32 260, ; 431
	i32 238, ; 432
	i32 196, ; 433
	i32 322, ; 434
	i32 158, ; 435
	i32 299, ; 436
	i32 225, ; 437
	i32 162, ; 438
	i32 131, ; 439
	i32 260, ; 440
	i32 160, ; 441
	i32 312, ; 442
	i32 249, ; 443
	i32 139, ; 444
	i32 272, ; 445
	i32 268, ; 446
	i32 298, ; 447
	i32 168, ; 448
	i32 195, ; 449
	i32 174, ; 450
	i32 210, ; 451
	i32 277, ; 452
	i32 39, ; 453
	i32 317, ; 454
	i32 236, ; 455
	i32 80, ; 456
	i32 55, ; 457
	i32 36, ; 458
	i32 96, ; 459
	i32 165, ; 460
	i32 171, ; 461
	i32 273, ; 462
	i32 81, ; 463
	i32 212, ; 464
	i32 97, ; 465
	i32 29, ; 466
	i32 158, ; 467
	i32 18, ; 468
	i32 126, ; 469
	i32 189, ; 470
	i32 118, ; 471
	i32 232, ; 472
	i32 263, ; 473
	i32 245, ; 474
	i32 288, ; 475
	i32 265, ; 476
	i32 182, ; 477
	i32 164, ; 478
	i32 240, ; 479
	i32 327, ; 480
	i32 262, ; 481
	i32 253, ; 482
	i32 169, ; 483
	i32 16, ; 484
	i32 143, ; 485
	i32 305, ; 486
	i32 292, ; 487
	i32 124, ; 488
	i32 117, ; 489
	i32 37, ; 490
	i32 114, ; 491
	i32 46, ; 492
	i32 141, ; 493
	i32 116, ; 494
	i32 33, ; 495
	i32 176, ; 496
	i32 94, ; 497
	i32 52, ; 498
	i32 175, ; 499
	i32 254, ; 500
	i32 128, ; 501
	i32 152, ; 502
	i32 24, ; 503
	i32 160, ; 504
	i32 231, ; 505
	i32 147, ; 506
	i32 103, ; 507
	i32 88, ; 508
	i32 198, ; 509
	i32 219, ; 510
	i32 197, ; 511
	i32 59, ; 512
	i32 141, ; 513
	i32 99, ; 514
	i32 5, ; 515
	i32 13, ; 516
	i32 121, ; 517
	i32 134, ; 518
	i32 27, ; 519
	i32 71, ; 520
	i32 229, ; 521
	i32 24, ; 522
	i32 217, ; 523
	i32 258, ; 524
	i32 255, ; 525
	i32 136, ; 526
	i32 210, ; 527
	i32 226, ; 528
	i32 167, ; 529
	i32 259, ; 530
	i32 100, ; 531
	i32 122, ; 532
	i32 230, ; 533
	i32 179, ; 534
	i32 180, ; 535
	i32 162, ; 536
	i32 166, ; 537
	i32 233, ; 538
	i32 38, ; 539
	i32 191, ; 540
	i32 304, ; 541
	i32 17, ; 542
	i32 170, ; 543
	i32 317, ; 544
	i32 136, ; 545
	i32 149, ; 546
	i32 222, ; 547
	i32 154, ; 548
	i32 129, ; 549
	i32 19, ; 550
	i32 64, ; 551
	i32 323, ; 552
	i32 146, ; 553
	i32 46, ; 554
	i32 297, ; 555
	i32 208, ; 556
	i32 78, ; 557
	i32 60, ; 558
	i32 296, ; 559
	i32 105, ; 560
	i32 257, ; 561
	i32 212, ; 562
	i32 48, ; 563
	i32 243, ; 564
	i32 254, ; 565
	i32 14, ; 566
	i32 314, ; 567
	i32 178, ; 568
	i32 67, ; 569
	i32 302, ; 570
	i32 170, ; 571
	i32 218, ; 572
	i32 222, ; 573
	i32 310, ; 574
	i32 326, ; 575
	i32 77, ; 576
	i32 227, ; 577
	i32 107, ; 578
	i32 211, ; 579
	i32 253, ; 580
	i32 66, ; 581
	i32 62, ; 582
	i32 203, ; 583
	i32 159, ; 584
	i32 220, ; 585
	i32 202, ; 586
	i32 10, ; 587
	i32 191, ; 588
	i32 11, ; 589
	i32 173, ; 590
	i32 77, ; 591
	i32 125, ; 592
	i32 82, ; 593
	i32 181, ; 594
	i32 65, ; 595
	i32 106, ; 596
	i32 64, ; 597
	i32 127, ; 598
	i32 121, ; 599
	i32 76, ; 600
	i32 268, ; 601
	i32 258, ; 602
	i32 325, ; 603
	i32 8, ; 604
	i32 226, ; 605
	i32 2, ; 606
	i32 43, ; 607
	i32 271, ; 608
	i32 155, ; 609
	i32 127, ; 610
	i32 256, ; 611
	i32 288, ; 612
	i32 23, ; 613
	i32 132, ; 614
	i32 214, ; 615
	i32 245, ; 616
	i32 320, ; 617
	i32 302, ; 618
	i32 28, ; 619
	i32 213, ; 620
	i32 61, ; 621
	i32 193, ; 622
	i32 89, ; 623
	i32 86, ; 624
	i32 306, ; 625
	i32 147, ; 626
	i32 195, ; 627
	i32 35, ; 628
	i32 85, ; 629
	i32 234, ; 630
	i32 315, ; 631
	i32 313, ; 632
	i32 310, ; 633
	i32 180, ; 634
	i32 49, ; 635
	i32 6, ; 636
	i32 89, ; 637
	i32 21, ; 638
	i32 161, ; 639
	i32 95, ; 640
	i32 49, ; 641
	i32 112, ; 642
	i32 250, ; 643
	i32 129, ; 644
	i32 75, ; 645
	i32 203, ; 646
	i32 315, ; 647
	i32 172, ; 648
	i32 227, ; 649
	i32 249, ; 650
	i32 7, ; 651
	i32 192, ; 652
	i32 109, ; 653
	i32 250, ; 654
	i32 236 ; 655
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
