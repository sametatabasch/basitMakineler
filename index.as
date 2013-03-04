fscommand("allowscale", "false");//Birden fazla fscommand yazınca  sadece son yazılanı  çalıştırıyor
import flash.events.MouseEvent;
import flash.utils.Timer;
import flash.events.Event;
var anaSayfaIcerik:anaSayfa = new anaSayfa  ;
var carklarIcerik:carklar = new carklar  ;
var cikriklarIcerik:cikriklar = new cikriklar  ;
var egikDuzlemlerIcerik:egikDuzlemler = new egikDuzlemler  ;
var kaldiraclarIcerik:kaldiraclar = new kaldiraclar  ;
var makaralarIcerik:makaralar = new makaralar  ;
////var oyunIcerik:oyun=new oyun;
var sozlukIcerik:sozluk = new sozluk  ;
var tekerlekVeKasnakIcerik:tekerlekVeKasnak = new tekerlekVeKasnak  ;
var vidalarIcerik:vidalar = new vidalar  ;
var konularIcerik:konular = new konular  ;
//var sinavIcerik:sinav= new sinav;
ileri.addEventListener(MouseEvent.CLICK,icerikGetirIleri);
geri.addEventListener(MouseEvent.CLICK,icerikGetirGeri);
var icerikNo:int = 0;
/**
 * etkinIcerik fonksiyonu 
 * icerik no ya göre aktif olan içerik nesnesini döndürür
 * @return object
 */
function etkinIcerik()
{
	switch (icerikNo)
	{
		case 0 :
			return anaSayfaIcerik;
			break;
		case 1 :
			return vidalarIcerik;
			break;
		case 2 :
			return carklarIcerik;
			break;
		case 3 :
			return cikriklarIcerik;
			break;
		case 4 :
			return tekerlekVeKasnakIcerik;
			break;
		case 5 :
			return kaldiraclarIcerik;
			break;
		case 6 :
			return egikDuzlemlerIcerik;
			break;
		case 7 :
			return makaralarIcerik;
			break;
		case 8 :
			return konularIcerik;
			break;
		/*case 9 :
			return oyunIcerik;
			break;
		case 10 :
			return sinavIcerik;
			break;*/
		case 11 :
			return sozlukIcerik;
			break;
		default :
			return anaSayfaIcerik;
			break;

	}
}
/**
 * temizle fonksiyonu
 * icerik nesnesine(sayfa gövdesini oluşturan nesne) boş bir swf çekerek sayfayı temizliyor
 *
 */
function temizle()
{
	/*if(icerikNo>=1){//içerik no yu  azaltınca olmayan içeriğe denk gelmiş oluyor 
	icerikNo--;
	icerik.removeChild(etkinIcerik());
	icerikNo++;
	}*/
}
/**
 * icerikGetir fonksiyonu
 * parametre ile belirtilen swf dosyasını icerik nesnesine yüklüyor.
 * @param swf string
 */
function icerikGetir()
{
	temizle();
	icerik.addChild(etkinIcerik());
	etkinIcerik().x = icerik.width / 2;
	etkinIcerik().y = icerik.height / 2;
}
/**
 * icerikGetirIleri fonksiyonu
 * icerikNo yu arttırarak sıradaki içeriği gösterir
 *
 */
function icerikGetirIleri(e:MouseEvent)
{
	icerikNo++;
	/*if ile son belirlenmeli */
	if (icerikNo<7)
	{
		icerikGetir()
	}
}
/**
 * icerikGetirGeri fonksiyonu
 * icerikNo yu azaltarak önceki içeriği gösterir
 *
 */
function icerikGetirGeri(e:MouseEvent)
{
	icerikNo--;
	/*if ile son belirlenmeli */
	if (icerikNo<0)
	{
		icerikNo=0;
	}
	icerikGetir();
}
icerikGetir();//ana sayfa 
//basla.enabled = false;
basla.addEventListener(MouseEvent.MOUSE_DOWN,function(){etkinIcerik().sesAc();});
basla.addEventListener(MouseEvent.MOUSE_UP,function(){etkinIcerik().sesDurdur();});

/////////////////////////////////////////////////;
/////////hizliMenu kodları///////////////////////
/////////////////////////////////////////////////
hizliMenu.yukariAsagiButon.addEventListener(MouseEvent.CLICK,menuAcKapat);
/**
 * menuAcKapat fonksiyonu
 * yukariasagiButon un durumuna göre menüyü açar yada kapatır
 *
 */
function menuAcKapat(e:MouseEvent)
{
	if (hizliMenu.yukariAsagiButon.currentFrame == 1)
	{
		menuAcKapatZamanlayici = setInterval(menuAc,0);
	}
	else if (hizliMenu.yukariAsagiButon.currentFrame==5)
	{
		menuAcKapatZamanlayici = setInterval(menuKapat,0);
	}
}

var menuAcKapatZamanlayici;
function baslaKapatMousesiz()
{
	menuAcKapatZamanlayici = setInterval(menuKapat,0);
}
function menuAc():void
{
	hizliMenu.maske.height +=  5;
	if (hizliMenu.maske.height >= 370)
	{
		clearInterval(menuAcKapatZamanlayici);
	}
	hizliMenu.yukariAsagiButon.gotoAndStop(5);
}
function menuKapat():void
{
	hizliMenu.maske.height -=  5;
	if (hizliMenu.maske.height <= 1)
	{
		clearInterval(menuAcKapatZamanlayici);
	}
	hizliMenu.yukariAsagiButon.gotoAndStop(1);
}

hizliMenu.vida.addEventListener(MouseEvent.CLICK,function(){icerikNo=1;icerikGetir();baslaKapatMousesiz();});
hizliMenu.cark.addEventListener(MouseEvent.CLICK,function(){icerikNo=2;icerikGetir();baslaKapatMousesiz();});
hizliMenu.cikrik.addEventListener(MouseEvent.CLICK,function(){icerikNo=3;icerikGetir();baslaKapatMousesiz();});
hizliMenu.tekerlek.addEventListener(MouseEvent.CLICK,function(){icerikNo=4;icerikGetir();baslaKapatMousesiz();});
hizliMenu.kaldirac.addEventListener(MouseEvent.CLICK,function(){icerikNo=5;icerikGetir();baslaKapatMousesiz();});
hizliMenu.egikduzlem.addEventListener(MouseEvent.CLICK,function(){icerikNo=6;icerikGetir();baslaKapatMousesiz();});
hizliMenu.makara.addEventListener(MouseEvent.CLICK,function(){icerikNo=7;icerikGetir();baslaKapatMousesiz();});
/////////////////////////////////////////////////

/////////////////////////////////////////////////
//////////////////kapat butonu///////////////////
/////////////////////////////////////////////////
kapat.addEventListener(MouseEvent.CLICK,kapatsinmi);
function kapatsinmi(e:MouseEvent)
{
	kapat.gotoAndStop(2);
	kapat.evetButon.addEventListener(MouseEvent.MOUSE_DOWN,function (){fscommand("quit");});
	kapat.hayirButon.addEventListener(MouseEvent.MOUSE_DOWN,function (){kapat.gotoAndStop(1);});
}
/////////////////////////////////////////////////;

/////////////////////////////////////////////////;
////////////////////yanMenu//////////////////////
/////////////////////////////////////////////////
var menuAcZamanlayici,menuKapatZamanlayici;
yanMenu.acKapatButon.addEventListener(MouseEvent.CLICK,yanMenuAcKapat);
/**
 * yanMenuAcKapat fonksiyonu
 * yan menü  açıksa kapatır kapalıysa açar
 *
 */
function yanMenuAcKapat(e:MouseEvent)
{
	if (yanMenu.acKapatButon.currentFrame == 1)
	{
		menuAcZamanlayici = setInterval(yanMenuAc,1);
	}
	else if (yanMenu.acKapatButon.currentFrame==5)
	{
		menuKapatZamanlayici = setInterval(yanMenuKapat,1);
	}
}
/**
 * yanMunuAc fonksiyonu
 * yan menünün açılmasını sağlıyor
 *
 */
function yanMenuAc():void
{
	yanMenu.x +=  5;
	if (yanMenu.x >= 100)
	{
		clearInterval(menuAcZamanlayici);
	}
	yanMenu.acKapatButon.gotoAndStop(5);
}
/**
 * yanMunuKapat fonksiyonu
 * yan menünün kapanmasını sağlıyor
 *
 */
function yanMenuKapat():void
{
	yanMenu.x -=  5;
	if (yanMenu.x <= 0)
	{
		clearInterval(menuKapatZamanlayici);
	}
	yanMenu.acKapatButon.gotoAndStop(1);
}
/////////////////////////////////////////////////;

/////////////////////////////////////////////////;
//////////////Yan menü  Butonlar/////////////////
/////////////////////////////////////////////////

//anasayfa
yanMenu.anaSayfaButon.addEventListener(MouseEvent.CLICK,anaSayfaButonFonksiyon);
yanMenu.anaSayfaButon.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.anaSayfaButon.gotoAndStop(2)});
yanMenu.anaSayfaButon.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.anaSayfaButon.gotoAndStop(1)});
function anaSayfaButonFonksiyon(e:MouseEvent)
{
	icerikNo=0;
	icerikGetir();
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//oyun
yanMenu.oyun.addEventListener(MouseEvent.CLICK,oyunButonFonksiyon);
yanMenu.oyun.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.oyun.gotoAndStop(2)});
yanMenu.oyun.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.oyun.gotoAndStop(1)});
function oyunButonFonksiyon(e:MouseEvent)
{
	//icerikGetir("SWF/oyun.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//sozluk
yanMenu.sozluk.addEventListener(MouseEvent.CLICK,sozlukButonFonksiyon);
yanMenu.sozluk.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.sozluk.gotoAndStop(2)});
yanMenu.sozluk.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.sozluk.gotoAndStop(1)});
function sozlukButonFonksiyon(e:MouseEvent)
{
	icerikNo=11;
	icerikGetir();
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//sinav
yanMenu.sinav.addEventListener(MouseEvent.CLICK,sinavButonFonksiyon);
yanMenu.sinav.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.sinav.gotoAndStop(2)});
yanMenu.sinav.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.sinav.gotoAndStop(1)});
function sinavButonFonksiyon(e:MouseEvent)
{
	//icerikGetir("SWF/sinav.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//konular
yanMenu.konular.addEventListener(MouseEvent.CLICK,konularButonFonksiyon);
yanMenu.konular.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.konular.gotoAndStop(2)});
yanMenu.konular.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.konular.gotoAndStop(1)});
function konularButonFonksiyon(e:MouseEvent)
{
	icerikNo=8;
	icerikGetir();
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
/////////////////////////////////////////////////