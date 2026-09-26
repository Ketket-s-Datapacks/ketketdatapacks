# FurniCraft geliştirme rehberi

Bu rehber 26.3 geçişi ve Poplar eklemesinden sonraki kaynak düzenini açıklar. Yeni işte önce güncel dosyaları oku; buradaki model sayısını, slotları veya sürümü değişmez kabul etme. Teknik seçimleri geliştirici/model yapar; kullanıcı model, görsel değerleri, craft gereksinimleri ve özel davranışları tarif eder.

## Kullanım

- [Yeni mobilya ekle](../.github/prompts/add-furniture.prompt.md): Verilen modelin item, yerleştirme, etkileşim, kırılma, craft ve katalog bağlantılarını tamamlar.
- [Yeni ahşap varyantı ekle](../.github/prompts/add-furniture-variant.prompt.md): Mevcut modelleri yeni malzeme ve head görselleriyle genişletir.

Örnek istekler:

```text
add-furniture: Bu summon modelini yeni bir sandalye olarak ekle.
Head value: <value>
Craft: 2 tahta + 1 yün -> 1 sandalye.
Oturulabilsin; ahşap türü ve minder rengi değişebilsin.
```

```text
add-furniture-variant: Yeni ahşabı mevcut ahşap mobilyalara ekle.
Tür: <tür>
stool: <value>
chair: <value>
Diğer mobilyaların değerleri: ...
Tarifler ve davranışlar mevcut türlerle aynı.
```

## Kaynak düzeni ve çalışma tarzı

Aşağıdaki yollar, aksi belirtilmedikçe `data/ketket_furnitures/` altındadır. Fonksiyon akışlarını anlatırken `function/` öneki ve `.mcfunction` uzantısı kısaltılabilir; örneğin `place/gettype`, `function/place/gettype.mcfunction` dosyasıdır. Bu dosyadan gerçek kaynak kökü [buradadır](../data/ketket_furnitures/).

- Namespace `ketket_furnitures`; kategori ve numaralı kimlikler (`chairs/chair1`, `tables/table1`) korunur. Yeni kimlik mevcut dosya ve taglarla çakışmamalı.
- Küçük `mcfunction` dosyaları, kategoriye göre dispatch, entity tagları, storage eşlemeleri ve mevcut makrolar kullanılır. Sırf yeni model/tür için yeni bir framework veya paralel kayıt sistemi kurma.
- Desteklenen ahşapları `load`, `place/settype/checktype` ve gerçek loot dosyalarından çıkar. 26.3/Poplar sonrasında 13 tür vardır. `darkoak` / `dark_oak` ve `pale` / `pale_oak` gibi mevcut ad farklarını her bağlantıda kontrol et; toplu yeniden adlandırma yapma.
- Davranışına en yakın çalışan örneği seç. `place/beds` veya `place/doors` gibi bir klasörün varlığı, oyuna bağlı ve tamamlanmış olduğu anlamına gelmez.
- Geçici `.migration-26.3` araçları bu geliştirme akışının bağımlılığı değildir; dağıtılan kaynak ve mevcut sunucu sürümü esas alınır.

## Item ve görsel verisi

Bir envanter mobilyası çoğunlukla `minecraft:player_head` itemıdır. Loot ile görünüş/veri ataması ayrı dosyalardadır:

| Sorumluluk | Örnek |
|---|---|
| Item üretimi ve modifier referansı | `loot_table/chairs/chair1/poplar.json` |
| Ad, head profile, custom data | `item_modifier/chairs/chair1/poplar.json` |
| Yerleştirme kimliği | `function/place/gettype.mcfunction` |
| Ahşap algılama | `function/place/settype/checktype.mcfunction` |

Mevcut 26.3 şeması:

- Loot entry içindeki alan `modifier`; değeri örneğin `ketket_furnitures:chairs/chair1/poplar`.
- Çok adımlı item modifier kökü `{"type":"minecraft:sequence","functions":[...]}` nesnesidir. Kökü doğrudan dizi yapma; işlem ayracı `type` alanıdır.
- Modifier, `set_name`, `set_components` ve `set_custom_data` adımlarını kullanır. Yerleştirme itemının custom data örneği `{furniture:1b,chair1:1b,poplar:1b}`. Ahşabı genel bir `type` alanı sanma: burada tür bayrağı vardır; katalog kitabında ise makro için `{type:poplar}` kullanılır.
- Texture yolu `minecraft:profile.properties` listesindeki `{name:"textures",value:"..."}` girdisidir. `value` metnini aynen kopyala; hash'i elle yeniden yazarak aktarma. Decode ederek eşleştirmeyi kontrol et, dosyadaki nihai değeri kullanıcı girdisiyle karşılaştır.
- Yeni görsele uygun, kararlı bir profile UUID üret; signed dört integer biçimini mevcut örnekten izle. Aynı UUID'yi farklı görsellere kopyalama.
- Envanter ikonu ile model içindeki player head parçaları ayrı görseller olabilir; kullanıcı eşleştirmesini koru.
- Modern item verisi `count` ve `components` kullanır. Eski `Count`, item `tag`, `SkullOwner` veya `display.Name` yollarını yeni dosyalara taşıma. Entity `Tags` ile item `components."minecraft:custom_data"` birbirinin yerine geçmez.

### Mevcut ahşap model eşleştirmesi

Loot/modifier yollarının sonuna `/<tür>.json` gelir. Kullanıcının adlarını bu tabloyla eşleştir; güncel kodda yeni model varsa tabloyu da güncelle.

| Kullanıcı adı | Loot/modifier yolu | Poplar bench slotu |
|---|---|---:|
| Stool | `chairs/chair1` | 3 |
| Chair | `chairs/chair2` | 4 |
| Park bench | `chairs/chair5` | 5 |
| Table | `tables/table1` | 6 |
| Low table | `tables/table2` | 7 |
| Pedestal table | `tables/table3` | 8 |
| Accent table | `tables/table4` | 12 |
| Cabinet | `cabinets/cabinet2` | 13 |
| Bedside cabinet | `cabinets/cabinet3` | 14 |
| Throne chair | `chairs/chair6` | 15 |
| Wall rack | `racks/rack1` | 16 |
| Wooled throne chair | `chairs/chair6/wooled` | 17, `woolon` |
| Armchair | `chairs/chair4` | 21, `woolon` |

`chair3` sofa ve `cabinet1` fridge bu ahşap tür listesinin parçası değildir. Mobilya kategorisi numarasından desteklediği varyantları tahmin etme.

## Yerleştirme, model ve koordinatlar

Akış: `function/tick` → `placer` / `tickfunc/placedetector` → yön/ray kontrolleri → `tickfunc/markerfunc` → `tickfunc/sumframe` → `place/gettype` → modelin place dosyası.

- `sumframe` dosya adı tarihsel olarak kalmıştır; geçici yerleştirme entitysi `minecraft:marker`, tagı `sumfurniture` olur. Yeniden item frame kullanma.
- Marker, yerleştirilen head bloğunun X/Z merkezindedir (`align xyz positioned ~0.5 ~ ~0.5`); Y değeri head bloğunun tabanıdır. Head metadata `block ~ ~ ~ components."minecraft:custom_data"` üzerinden okunur. Standart yerleştirmeye eski `~-1` kaymasını ekleme.
- Yön tagları `north`, `south`, `east`, `west`. Verilen modelin ön yönünü bunlara eşleştir. Model pivotu farklıysa dönüşümü bir kez ve tutarlı uygula; hitbox, gerçek bloklar, oturma ve remover konumları aynı referanstan türesin.
- Model geometrisi display `Pos`/summon konumu ile `transformation` birlikte değerlendirilerek bulunur. Görselin merkezi, interaction entitysi ve fiziksel blok aynı Y'de olmak zorunda değildir.
- Yerleştirmeye bir koordinat tablosuyla başla: marker tabanı, her kök display, interaction, fiziksel bloklar, oturma noktası, checker'ın hedef bloğu ve remover başlangıcı. `block` komutlarının ondalıklı koordinatları aşağı yuvarladığını, negatif Y'de de aynı kuralın geçerli olduğunu hesaba kat.
- Ahşap modelin değişecek parçaları `justspawn` ve uygun malzeme rolünü alır. `place/settype/findtype`, türü okur/uygular, `justspawn` taglarını temizler, head bloğunu siler ve geçici marker'ı kaldırır. Bu fonksiyon çağrıldıktan sonra marker'ı tekrar seçmeye veya head verisini okumaya ihtiyaç bırakma.
- Head bloğunu chest/cauldron/light gibi bir blokla değiştiren özel modellerde sıralamayı ayrıca kur. `findtype` özel blok kurulumunu yanlışlıkla silmemeli. Modelde kullanılan bütün parçaların cleanup yolu olmalı.

## Tür değiştirme, soyma ve boyama

Malzeme eşlemeleri `function/load.mcfunction` içinde `minecraft:typeholder.type.<tür>` altında tutulur. Katalog makroları `minecraft:type.<tür>` altındadır. Bazı çağrılardaki `typeholder` kısa adı `minecraft:typeholder` ile aynıdır; yeni çağrıda rastgele namespace değiştirme.

Mevcut rol tagları: `log`, `wood`, `stripped_log`, `stripped_wood`, `planks`/`plank`, `fence`, `fence_gate`, `button`, `trapdoor`, `door`, `pressure_plate`. Storage'da `stairs`/`slab` bulunması, mevcut settype fonksiyonlarının bu rolleri işlediği anlamına gelmez. Yeni model yeni rol gerektiriyorsa desteklenen tüm türlerde place ve changetype uygulamasını da tamamla.

26.3'te varsayılan `block_state`, `"minecraft:poplar_planks"` gibi bir string olarak saklanabilir. Yönlü/özellikli durumlar `{id:...,properties:...}` nesnesi olabilir. Entity üzerinde doğrudan `block_state.id` yazmak her iki biçimde çalışmaz.

Şu mevcut yardımcıları kullan:

```mcfunction
execute as @e[type=block_display,tag=justspawn,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.poplar.log"}
execute as @e[type=block_display,tag=log,distance=..0.5] run function ketket_furnitures:internal/block_state/set_id {id:"minecraft:stripped_poplar_log"}
```

Bunlar mevcut yön/açıklık/eksen özelliklerini koruyarak kimliği değiştirir. Modelin koordinatlarına uygun selector kullan; örnekteki mesafeyi her modele körlemesine kopyalama. Storage hedefinin varlığını doğrula. Helper içindeki geçici compound düzenlemesi ile entityye doğrudan `.id` yazmayı karıştırma.

- Yeni tür: `place/settype`, `interaction/changetype`, üst dispatch fonksiyonları, `changetype/settag` ve `interaction/strip` birlikte güncellenir.
- Her interaction üzerinde yalnız bir ahşap türü tagı kalsın; eski tag kalırsa kırılınca birden fazla loot dalı çalışabilir.
- Stripped log ve stripped wood girdileri ayrı koşullardır; ikisi de ilgili malzemeyi ve interaction `stripped` durumunu uygular.
- Boyama `interaction/dye`, `interaction/changedye/*` ve `minecraft:colorholder.color.<renk>` ile yapılır. Mevcut roller `carpet`, `wool`, `candle`; yeni boyanabilir parçayı bunlara bağla veya gereken rolü tutarlı genişlet.
- Mevcut drop sistemi genel olarak ahşap türüne göre standart item üretir; yerleştirilmiş mobilyanın son boya/soyulma durumunu otomatik sakladığını varsayma. Kullanıcı bu durumların itemda korunmasını istiyorsa item verisi, loot ve yeniden yerleştirme için ayrıca uygula.

## Etkileşim, blok kontrolü ve tek drop

`furniture_tick2` interaction verisini `click/left` ve `click/right` akışlarına taşır. `furniture_tick` / `tickfunc/blockchecker` fiziksel blok kontrollerini yürütür. Oturma için `sit/` ve `sitable` entity düzenini, bağlanan modeller için kendi `connect`/`disconnect` dosyalarını incele.

- `removercheck` kategoriye göre sökme fonksiyonunu çağırır. Sökme fonksiyonunun hangi entity ve konumla çağrıldığını açıkça belirle; tıklama ve checker girişlerini o konuma normalize et.
- Checker, gerçekten yerleştirilmiş fiziksel bloğu kontrol etmeli. Mailbox interaction'ı tabandan `0.03` yukarıdadır; head kontrolü aynı bloktadır, bir üst blokta değildir.
- Fridge örneğinde interaction tabanda, display kökü `0.99` yukarıdadır; cauldron tabanda, dropper bir üsttedir. Güncel remover dispatch'i `at @s align y positioned ~ ~1 ~` ile iki yolu üst bloğa taşır. Bu sayıları farklı mobilyaya ölçmeden kopyalama.
- Birden fazla entity aynı mobilyayı sökebiliyorsa önce bütün ilgili parçalara ortak `break` işareti koy, sonra blokları sil ve loot üret. İşaretlenmiş parça tekrar loot üretmemeli. Örnek: `function/remover/cabinets/cabinet1.mcfunction`.
- `dropitem`, creative/survival ve özel depolama davranışlarını yakın örnekle karşılaştır. Fridge gibi özel remover'ı bütün kategoriler için drop politikası sayma.
- Selector'ları model tagı, entity türü ve gerekli konum/mesafeyle sınırla. Yakındaki başka mobilyanın parçalarını veya ilgisiz düşmüş itemları temizleme. Yan yana yerleşim ve iki kırılma yolunun art arda çalışması kontrol listesinde olmalı.

## Carpenter bench: menü ile ücret ayrı işlerdir

Girdiler 0 tabanlı container slotları **9 ve 10** üzerinden yönetilir. `woodcount` ana malzemenin, `woolcount` ikincil malzemenin sayacıdır; isimler her zaman gerçek item türünü ifade etmez.

| Dosya/alan | Sorumluluk |
|---|---|
| `carpenterbench/tick`, `menuset`, `detecttype` | Menü yenileme ve aktif girdi seçimi |
| `slot9`, `slot10` | Her iki konumdaki ana malzemeyi doğru menüye yönlendirme |
| `subcheck9`, `subcheck10` | Karşı slottaki yün/demir gibi ek malzeme ve miktarı |
| `menu/<tür>` | Sonuç itemlarını ilgili slotlara koyma, `woolon` gibi koşullar |
| `craft/*` | Sonuç slotundan alınan itemı algılama, `crafted`/`craftedsub` |
| `itemcraft` | Ana/ikincil malzeme miktarını düşürme ve boşalan girdiyi temizleme |
| `menu/checker` | Sayaçları okuma, craft kontrolü, kalan miktarı block itemına yazma |
| `return/*` | İşlenmemiş malzemeyi components dahil geri verme |

Mevcut genel ücretlendirme `crafted` için 1 ana, `craftedsub` için 1 ikincil malzeme düşürür. Kullanıcının “2 tahta + 1 yün” demesi yalnız menü dosyasına yeni loot ekleyerek uygulanamaz. Tarif özelinde yeterli miktar kontrolü, doğru tüketim, çıktı adedi ve menü yenilemesini birlikte düzenle; bütün tariflerin maliyetini topluca değiştirme. Yetersiz miktarda veya eksik ikincil malzemeyle sonuç alınamamalı.

Yeni slot seçerken tüm aktif menüleri, filler/empty slot kurulumunu, `craft/*` kontrollerini ve mevcut sonuç slotlarını incele. Dolu bir slotu ezme veya girdi slotunu sonuç için kullanma. Malzemeler 9/10 arasında değiştirildiğinde aynı tarifin çalıştığını kontrol et.

## Katalog

`catalog/getcatalog` yeni kitabı verir; `catalog/settype` seçili türle kitabı yeniden üretir. Mobilya listesi ve tür seçimi iki dosyada da güncellenmelidir. Türlü mobilyalar için `catalog/give/*` içinde `$loot ... /$(type)` makroları kullanılır.

- Mevcut ahşaba yeni model eklerken yeni give makrosu gerekir; mevcut modellere yeni ahşap eklerken mevcut makrolar kullanılabilir.
- Kitabın sayfa yüksekliğini, satır genişliğini, `change_page` bağlantılarını ve tıklama komutlarını kontrol et. Yalnız geçerli SNBT olması, metnin sayfaya sığdığını kanıtlamaz.
- Yeni yazılan text component olaylarında mevcut `click_event` biçimini kullan. Eski dosyalardaki her alanı otomatik doğru şablon kabul etme.
- Mevcut oyuncu kitapları dosya değişince kendiliğinden güncellenmez. `/reload` sonrası `/function ketket_furnitures:catalog/getcatalog` ile yeni kitap alınabilir; bu komut yetki gerektirir. Mevcut creative `getcatalog` trigger akışı da kullanılabilir.

## Tamamlanma kontrol listesi

- [ ] Yeni JSON/SNBT geçerli; gerçek Minecraft sürümünün blok/item kimlikleri ve modifier şeması kullanılıyor.
- [ ] Kullanıcıya ait head value değerleri nihai dosyalarda birebir aynı; model içi görseller ile item görselleri doğru eşleştirildi.
- [ ] Loot, modifier, function ve storage referansları çözülüyor. Yorum satırları ve `$(type)` gibi makrolar kontrol sırasında doğru ele alındı.
- [ ] Her istenen model/varyant: katalog veya craft → item → yerleştirme → etkileşim → tek doğru drop zincirine bağlı.
- [ ] Dört yön, taban yüksekliği, hitbox, varsa oturma/bağlanma/gerçek bloklar ve sökme konumları tutarlı.
- [ ] Tür değişimi iki yönde çalışıyor; log/wood ve soyulmuş girdiler doğru; yön/açıklık/eksen korunuyor.
- [ ] Boyanabilen parçalar ve istenen özel davranışlar bağlı; eski tür tagları temizleniyor.
- [ ] Craft iki input slotunda da doğru; adetler, ikincil malzeme, yetersiz girdi ve malzeme iadesi dikkate alındı.
- [ ] Tıklama ile kırılma ve fiziksel blok kırılması aynı mobilyayı ikinci kez düşürmüyor; komşu mobilya ve depolanan içerik etkilenmiyor.
- [ ] Yeni katalog sayfaları ve tür değiştirdikten sonraki katalog birbirine uyumlu.

Kaynak/koordinat kontrollerini ve varsa gerçek sürümün codec doğrulamasını yap. Oyunda denenmeyen davranışı denenmiş gibi raporlama. Kullanıcı istemedikçe test dünyası oluşturma. Açık kullanıcı sunucusunu ikinci kez başlatma; konsol erişimin yoksa `/reload` ile kısa oyun içi kontrolü kullanıcıya bildir. İşi bitirirken yapılan doğrulamayı ve kalan oyun içi kontrolleri kısa, açık biçimde ayır.
