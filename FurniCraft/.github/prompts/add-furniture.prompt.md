---
description: "Verilen modeli, görselleri ve tarifi FurniCraft'ın mevcut akışlarına eksiksiz bağla"
argument-hint: "Mobilya adı + model/summon verisi + head value değerleri + craft malzemeleri/adetleri + varsa özel davranışlar"
agent: "agent"
---

FurniCraft'a yeni mobilyayı doğrudan uygula. Önce [geliştirme rehberini](../../docs/furniture-development.md) ve değiştireceğin akışların güncel kodunu oku. Yalnız mevcut mobilyalara yeni ahşap türü ekleniyorsa [varyant ekleme akışını](add-furniture-variant.prompt.md) uygula.

## Kullanıcıdan gerekenler

Kullanıcının aşağıdaki bilgileri vermesi yeterli olmalı; dahili tag, dosya yolu, scoreboard veya menü slotlarını kullanıcıya tasarlatma.

```text
Mobilya: <ad>
Model: <summon komutları / model verisi / dosya yolu>
Head value: <envanter itemı için value; varsa türlere göre eşleştirme>
Modeldeki özel kafa görselleri: <varsa parça adı -> value>
Craft: <malzeme ve adetler> -> <çıktı adedi>
Ek detaylar: <varsa oturma, boyama, açılma, bağlanma, depolama vb.>
```

Bu şablon zorunlu bir form değildir; serbest anlatımdan aynı bilgileri çıkar. Kullanıcının zaten verdiği bilgileri tekrar sorma. Kategori, boş kimlik, taglar, yön dosyaları, uygun menü slotu ve `blockchecker` gereksinimini modelden ve benzer mobilyadan çıkar. Varsayımları kısa biçimde belirtip ilerle. Eksik model/görsel, belirsiz ücret veya modelin hangi tarafının ön olduğu gibi sonucu değiştiren ve koddan çıkarılamayan bilgileri sor; bağımsız işleri sürdür. Eksik texture yerine rastgele başka mobilyanın texture'ını kullanma.

## Uygulama

1. **Referans ve kimlik:** Görünüşten çok davranışına göre benzer mobilyayı seç. Kullanılmayan kategori kimliği belirle; yerleştirme, item custom data, interaction ve remover kimliklerini eşleştir. Yerel kullanıcı değişikliklerini koru. İnaktif taslak dosyayı çalışan referans sanma.
2. **Item:** `loot_table/` ve eşleşen `item_modifier/` dosyalarını oluştur. Head value değerlerini aynen kullan, profile UUID'sini üret. Ad, `furniture:1b`, mobilya kimliği ve varsa ahşap türü bayrağını ekle. İstenen her varyant için ayrı item bağlantısını tamamla.
3. **Model:** Verilen modelin bütün display/parça/passenger verilerini entegre et. Yalnız interaction iskeleti bırakma. Modelin önünü, tabanını ve pivotunu belirleyip mevcut yön etiketlerine uyarla. Gerekli yön dönüşlerini ve hitbox'ları üret; mobilyanın şeklini değiştirme.
4. **Yerleştirme:** `place/gettype` yönlendirmesini ve kategori altındaki place fonksiyonunu bağla. Geçici marker'ın taban koordinatını kullan. Malzeme/renk değişebilen parçalara mevcut rol taglarını ver; `justspawn` ve tür atama/temizleme sırasını tamamla. Gerçek blok kullanan modellerde gerekli veriyi bloğu değiştirmeden önce oku.
5. **Davranış:** Tür değiştirme, soyma ve boyama için mevcut yardımcıları kullan. Oturma, bağlantılı parçalar, kapak/perde hareketi, depolama gibi istenen davranışları mevcut `click/`, `interaction/`, `sit/`, `connect`/`disconnect` düzenine bağla. Modelde bulunmayan özellik ekleme.
6. **Kırılma:** `removercheck`, ilgili remover ve gerekiyorsa `tickfunc/blockchecker` bağlantılarını tamamla. Tıklama ve blok kırılma yolları aynı sökme konumunda birleşsin. Aynı mobilya yalnız bir kez loot üretsin; komşu mobilyaya dokunmadan tüm parçaları ve kendi fiziksel bloklarını temizlesin. Varyanta göre doğru item dönsün; varsa depolanan içerik korunsun.
7. **Carpenter bench:** Girdileri `slot9` ve `slot10`, ikincil malzemeyi `subcheck9/10`, sonucu `menu/*`, ücretlendirmeyi `craft/*`, `itemcraft` ve `menu/checker` boyunca bağla. Menüde item göstermek tarifi tamamlamaz. Kullanıcının verdiği adetler ve çıktı sayısı fiilen uygulansın; yetersiz malzemeyle çıktı alınamasın. Çakışan slotu ezme; gerekiyorsa mevcut düzene uygun küçük menü genişletmesini yap.
8. **Katalog:** Aksi belirtilmedikçe yeni mobilyayı hem `catalog/getcatalog` hem `catalog/settype` kitabına ekle. Türlü item için `catalog/give/` makrosunu bağla. Mevcut tür seçimini koru; sayfa boyunu ve sayfa bağlantılarını kontrol et.
9. **Doğrulama:** Rehberdeki ortak kontrol listesini uygula. Yeni eşyanın elde edilmesinden yerleştirilmesine, değiştirilmesine ve geri düşmesine kadar zinciri kontrol et. Başlangıçta sunucunun yüklenebilmesini tek başına davranış doğrulaması sayma.

## Tamamlama

Kısa biçimde eklenen mobilyayı/varyantları, craft malzemelerini ve adetlerini, önemli dosyaları ve yapılan doğrulamayı bildir. `/reload` ve gerekiyorsa yeni katalog alma adımını belirt. Oyunda denenmeyen davranışları açıkça ayır. İstenen işi yalnız plan, taslak item veya yarım model bırakarak bitirme.
