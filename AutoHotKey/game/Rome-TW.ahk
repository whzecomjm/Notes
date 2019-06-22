#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;

; Rome - Total War
#IfWinActive ahk_class Rome: Total War
; 使用win10时不要用XP兼容，不然无法调用
:*:wa::auto_win attacker{Enter}``
:*:wd::auto_win defender{Enter}``
:*:pro::process_cq{Space}
:*:fow::toggle_fow{Enter}
:*:addm::add_money{Space}
:*:addp::add_population{Space}
:*:moz::show_cursorstat

;城市名使用中文拼音首字母简写，两三个字的城市名使用的是全称的首字母，四个字以上用前三个字，部分的城市名首字母重复较多，可能使用4个甚至5个字母。注意有重复前缀的城市中，短城市名需要换行或者空格。
:*:abl::Apollonia ;阿波罗尼亚
:*:aet::Artaxarta ;阿尔塔沙特
:*:akl::Ancyra ;安卡拉
:*:alx::Alesia ;阿雷西亚
:*:aln::Campus_Alanni ;阿兰尼
:*:asj::Arsakia ;阿萨基亚
:*:ask::Osca ;奥斯卡
:*:ast::Asturica ;阿斯图里加
:*:atk::Antioch ;安条克
:*:bdp::Aquincum ;布达佩斯
:*:bdx::Bordesholm ;博登肖姆
:*:bll::Porrolissum ;波罗里森
:*:bls::Bylazora ;贝拉索拉
:*:blw::Batavodurum ;巴达维(巴拉维)
:*:bdw::Batavodurum ;巴达维(巴拉维)
:*:bsz::Bostra ;波斯卓
:*:bzt::Byzantium ;拜占庭
:*:dbs::Thebes ;底比斯
:*:dex::Domus_Dulcis_Domus ;杜尔西斯
:*:dje::Tingi ;丹吉尔
:*:dlp::Lepcis_Magna ;大列普提斯
::dm::Damme ;达姆
:*:dmd::Dimmidi ;狄米迪
::dms::Dumatha ;杜马萨
:*:dmsg::Damascus ;大马士革，由于和上面的城市重名使用四个字符
:*:dw::Deva ;迪瓦
:*:fls::Phraaspa ;弗拉斯帕
:*:gt::Vicus_Gothi ;哥特
:*:hlk::Halicarnasus  ;哈利卡纳苏斯
:*:htl::Hatra ;哈特拉
::jt::Campus_Getae ;加泰
:*:jtj::Carthage ;迦太基
:*:ked::Corduba ;科尔多巴
:*:kdn::Kydonia ;科多尼亚
:*:kld::Croton ;克罗顿
:*:kll::Caralis ;卡拉里斯
:*:kls::Corinth ;柯林斯
:*:kpy::Capua ;卡普亚
:*:kty::Kotais ;库塔伊西
:*:la::Lugdunum ;里昂
:*:le::Condate_Redonum ;雷恩
::ld::Londinium ;伦敦
:*:lds::Rhodes ;罗德斯
:*:llb::Lilybaeum ;利利俾
:*:lls::Larissa ;拉里萨
:*:lm::Lemonum ;里蒙
:*:lom::Rome ;罗马，因为和里蒙的辅音重复使用lo表示罗
:*:lwx::Lovosice ;洛沃西采
:*:mfs::Memphis ;孟菲斯
:*:mkm::Vicus_Marcomannii ;马科曼尼
:*:ml::Mediolanium ;米兰
::ms::Massilia ;马赛
:*:msk::Mazaka ;马萨卡
:*:mxn::Messana ;墨西拿
:*:myc::Mogontiacum ;美因茨(ci)
:*:neb::Narbo_Martius  ;纳尔榜玛提厄斯
:*:nkm::Nicomedia ;尼科米底亚
:*:nmt::Numantia ;努曼提亚
:*:npt::Nepte ;涅普特
:*:pem::Palma ;帕尔马
:*:pdw::Patavium ;帕多瓦
:*:pjm::Pergamum ;珀加蒙
:*:pml::Palmyra ;帕米拉
:*:ptl::Petra ;佩特拉
:*:qsn::Chersonesos ;切索尼斯
:*:sbd::Sparta ;斯巴达
:*:sds::Sardis ;萨狄斯
:*:sem::Campus_Sarmatae ;萨尔玛提亚
:*:sez::Iuvavum ;萨尔茨堡
::sjst::Segesta ;塞吉斯塔
:*:sjstk::Segestica ;塞吉斯提卡，没办法只能5个
::sk::Campus_Sakae ;塞克
:*:skl::Scallabis ;斯卡拉比斯
:*:slm::Salamis ;萨拉米斯
:*:sln::Salona ;萨罗纳
:*:slx::Seleucia ;塞琉西亚
::sm::Thermon ;色蒙
:*:sml::Samarobriva  ;萨马罗布里瓦
:*:sms::Themiskyra ;塞米斯卡拉
::ss::Susa ;苏撒
:*:ssl::Thessalonica ;塞萨洛尼卡
:*:st::Cirta ;瑟塔
:*:tes::Tarsus ;塔尔苏斯
::tl::Tara ;塔拉
:*:tle::Trier ;特里尔
:*:tls::Tylis ;泰里斯
:*:tlt::Tarentum ;塔伦图姆
:*:tns::Tanais ;塔奈斯
:*:tps::Thapsus ;塔普苏斯
:*:wnd::Vicus_Venedae ;威尼达
:*:xd::Sidon ;西顿
:*:xxy::Campus_Scythii  ;西徐亚
:*:xjtj::Carthago_Nova ;新迦太基
:*:xlg::Syracuse ;叙拉古
:*:xln::Cyrene ;昔兰尼
:*:xnp::Sinope ;锡诺普
:*:xw::Siwa ;锡瓦
:*:yd::Athens ;雅典
:*:yk::Eburacum ;约克郡，用两个常用字符即可
:*:ylm::Ariminum ;亚里米伦
:*:ylsd::Alexandria ;亚历山大，4个字符
:*:ylsl::Jerusalem ;耶路撒冷，4个字符
:*:ylt::Arretium ;亚雷提恩
:*:ysj::Campus_Iazyges ;雅斯基
#IfWinActive
