---
description: "Mevcut FurniCraft mobilyalarına yeni ahşap türünü item, craft, tür değişimi, soyma, drop ve katalog dahil ekle"
argument-hint: "Ahşap türü + mobilya adı -> head value listesi + varsa blok eşlemeleri, craft veya davranış istisnaları"
agent: "agent"
---

FurniCraft'a yeni ahşap varyantını doğrudan uygula. Önce [geliştirme rehberini](../../docs/furniture-development.md) oku; ardından Poplar'ın güncel bağlantılarını çalışan örnek olarak takip et. Yeni bir model/mobilya da isteniyorsa [mobilya ekleme akışını](add-furniture.prompt.md) birlikte uygula.

## Girdi ve varsayımlar

```text
Tür: <ad; örneğin poplar>
Head değerleri:
  stool: <value>
  chair: <value>
  ...
Ortak görseller: <örneğin accent table / throne / wooled throne: value>
İstisnalar: <varsa farklı blok eşlemeleri, craft miktarları, desteklenmeyen modeller>
```

- Mevcut ahşap mobilyaların geometrisini, tarif adetlerini, menü slotlarını ve özel davranışlarını devral. Kullanıcı sadece yeni tür ve görseller veriyorsa bunları yeniden sorma.
- Verilen isimleri rehberdeki model tablosuyla eşleştir; ortak görselin her hedefini işle. Güncel kaynakta tabloya eklenmiş başka ahşap mobilya varsa onu da incele. Eksik görseli sessizce başka türden kopyalama; kapsamı kullanıcı anlatımından çıkar, gerekli eksikliği sor.
- Minecraft blok kimliklerini çalışan sürümün verisinden doğrula. Vanilla ahşap ailesinde adlar düzenli olsa da bamboo, pale oak, crimson/warped gibi özel eşlemeleri tahminle türetme.
- Tür kimliği, item custom data bayrağı, interaction tagı ve loot dosya adı tutarlı olsun. Kullanıcının teknik tag veya storage yollarını vermesi gerekmez.

## Eksiksiz bağlantı listesi

`data/ketket_furnitures/` altında:

1. **Itemlar:** Kapsamdaki her model için `loot_table/<kategori>/<model>/<tür>.json` ve `item_modifier/` karşılığını oluştur. `chairs/chair6/wooled/<tür>` alt varyantını unutma. Adı, tür bayrağını, modifier referansını ve profile'ı güncelle. Kullanıcının base64 değerini birebir koru; eski profile UUID'sini yeni görsele kopyalama.
2. **Storage:** `function/load.mcfunction` içinde `minecraft:type` altına katalog makro girdisi; `minecraft:typeholder.type.<tür>` altına tüm gerekli blok eşlemelerini ekle. `log`, `wood`, `stripped_log`, `stripped_wood`, `planks`, `stairs`, `slab`, `fence`, `fence_gate`, `door`, `trapdoor`, `pressure_plate`, `button` alanlarını örnekle karşılaştır.
3. **Yerleştirme:** `function/place/settype/<tür>.mcfunction` oluştur, `checktype` içine head custom data kontrolünü ekle. Malzeme rolleri ve interaction tür tagı güncellensin. Model summon dosyalarını sırf yeni ahşap için çoğaltma.
4. **Tür değiştirme:** `function/interaction/changetype/<tür>.mcfunction` oluştur. Üstteki `changetype.mcfunction` içine log, wood, stripped log ve stripped wood girdilerini ekle. `changetype/settag` eski türleri temizlerken yeni türü de kaldırabilsin; böylece yeni türden eski türe dönüşte çift loot oluşmasın.
5. **Soyma:** `function/interaction/strip.mcfunction` içine log ve wood için iki yeni eşleme ekle. Tür değiştirmedeki iki soyulmuş girdi de hem doğru blokları hem `stripped` tagını uygulasın. `stripped_wood` koşulunu yanlışlıkla `stripped_log` dalına kopyalama.
6. **Drop:** Kapsamdaki her `function/remover/` dosyasına yeni türün loot dalını ekle. Throne için `wooled` ve `!wooled` yollarını ayrı tut. Başka tür tagının kalıp birden fazla dalı çalıştırmadığını kontrol et.
7. **Craft:** `function/carpenterbench/menu/<tür>.mcfunction` oluştur. `slot9` ve `slot10` içine planks, log, wood ve iki soyulmuş biçimin yönlendirmesini ekle. Yün gerektiren mobilyaları `woolon` koşuluyla koru. Aynı modeller/slotlar/adetler devralınıyorsa ortak ücretlendirmeyi değiştirme; istisna varsa mobilya ekleme rehberindeki maliyet akışını da tamamla.
8. **Katalog:** Hem `function/catalog/getcatalog.mcfunction` hem `settype.mcfunction` içine tür seçimini ekle. Seçim `function ketket_furnitures:catalog/settype with storage minecraft:type <tür>` komutuna bağlansın. Mevcut `catalog/give/*` makroları `$(type)` kullanır; yeni tür için kopyalarına gerek yoktur. Sayfaya sığdığını kontrol et; Poplar örneğinde Pale ve Poplar aynı satırdadır.

## Doğrulama ve teslim

- Her yeni head value'yu kullanıcının verdiği değerle birebir karşılaştır; ortak görseller dahil bütün hedefleri doğrula.
- Loot → modifier → custom data → place → interaction türü → remover zincirini her model için kontrol et.
- Yeni storage yolları ve bloklar mevcut olsun; helper çağrıları `block_state` özelliklerini korusun.
- Katalogdan alma, iki input slotundan craft, yünlü tarif, eski tür → yeni tür → eski tür, iki soyulmuş girdi ve baltayla soyma senaryolarını kontrol et.
- Kırınca tam bir doğru item dönsün. Geometri, oturma, yön ve boyama davranışında gereksiz değişiklik yapma.
- Rehberdeki ortak doğrulama kurallarını uygula; oyun içinde denenmeyeni test edilmiş gibi bildirme.

Sonuçta tür adını, eklenen model sayısını, kapsanan akışları ve doğrulama sonucunu kısa bildir. `/reload` ve yeni katalog alma gerektiğini belirt.
