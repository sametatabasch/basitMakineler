fscommand("allowscale", "false");//Birden fazla fscommand yazınca  sadece son yazılanı  çalıştırıyor
import flash.events.MouseEvent;
ileri.addEventListener(MouseEvent.CLICK,icerikGetirIleri);
geri.addEventListener(MouseEvent.CLICK,icerikGetirGeri);
var icerikNo:uint = 0;

/**
 * temizle fonksiyonu
 * icerik nesnesine(sayfa gövdesini oluşturan nesne) boş bir swf çekerek sayfayı temizliyor
 *
 */
function temizle()
{
	var yukleIcerik:Loader = new Loader();
	var temizle:URLRequest = new URLRequest("SWF/0.swf");
	yukleIcerik.load(temizle);
	icerik.addChild(yukleIcerik);
}
/**
 * icerikGetir fonksiyonu
 * parametre ile belirtilen swf dosyasını icerik nesnesine yüklüyor.
 * @param swf string
 */
function icerikGetir(swf:String)
{
	temizle();
	var yukleIcerik:Loader = new Loader();
	var Swf:URLRequest = new URLRequest(swf);
	yukleIcerik.load(Swf);
	icerik.addChild(yukleIcerik);
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
		temizle();
		var yukleIcerik:Loader = new Loader();
		var Swf:URLRequest = new URLRequest("SWF/"+ icerikNo +".swf");
		yukleIcerik.load(Swf);
		icerik.addChild(yukleIcerik);
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
	if (icerikNo<1)
	{
		temizle();
		var yukleIcerik:Loader = new Loader();
		var Swf:URLRequest = new URLRequest("SWF/"+ icerikNo +".swf");
		yukleIcerik.load(Swf);
		icerik.addChild(yukleIcerik);
	}
}
icerikGetir("SWF/anasayfa.swf");
basla.enabled = false;

/////////////////////////////////////////////////
/////////hizliMenu kodları///////////////////////
/////////////////////////////////////////////////
trace(hizliMenu.yukariAsagiButon.currentFrame);
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

hizliMenu.vida.addEventListener(MouseEvent.CLICK,icerikGetir1);
function icerikGetir1(e:MouseEvent)
{
	icerikGetir("SWF/1.swf");
	baslaKapatMousesiz();
	icerikNo = 1;
}
hizliMenu.cark.addEventListener(MouseEvent.CLICK,icerikGetir2);
function icerikGetir2(e:MouseEvent)
{
	icerikGetir("SWF/2.swf");
	baslaKapatMousesiz();
	icerikNo = 2;
}
hizliMenu.cikrik.addEventListener(MouseEvent.CLICK,icerikGetir3);
function icerikGetir3(e:MouseEvent)
{
	icerikGetir("SWF/3.swf");
	baslaKapatMousesiz();
	icerikNo = 3;
}
hizliMenu.tekerlek.addEventListener(MouseEvent.CLICK,icerikGetir4);
function icerikGetir4(e:MouseEvent)
{
	icerikGetir("SWF/4.swf");
	baslaKapatMousesiz();
	icerikNo = 4;
}
hizliMenu.kaldirac.addEventListener(MouseEvent.CLICK,icerikGetir5);
function icerikGetir5(e:MouseEvent)
{
	icerikGetir("SWF/5.swf");
	baslaKapatMousesiz();
	icerikNo = 5;
}
hizliMenu.egikduzlem.addEventListener(MouseEvent.CLICK,icerikGetir6);
function icerikGetir6(e:MouseEvent)
{
	icerikGetir("SWF/6.swf");
	baslaKapatMousesiz();
	icerikNo = 6;
}
hizliMenu.makara.addEventListener(MouseEvent.CLICK,icerikGetir7);
function icerikGetir7(e:MouseEvent)
{
	icerikGetir("SWF/7.swf");
	baslaKapatMousesiz();
	icerikNo = 7;
}
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
	if (yanMenu.x>=100)
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
	if (yanMenu.x<=0)
	{
		clearInterval(menuKapatZamanlayici);
	}
	yanMenu.acKapatButon.gotoAndStop(1);
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
//////////////Yan menü  Butonlar/////////////////
/////////////////////////////////////////////////

//anasayfa
yanMenu.anaSayfa.addEventListener(MouseEvent.CLICK,anaSayfaButonFonksiyon);
yanMenu.anaSayfa.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.anaSayfa.gotoAndStop(2)});
yanMenu.anaSayfa.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.anaSayfa.gotoAndStop(1)});
function anaSayfaButonFonksiyon (e:MouseEvent) {
	icerikGetir("SWF/anasayfa.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//oyun
yanMenu.oyun.addEventListener(MouseEvent.CLICK,oyunButonFonksiyon);
yanMenu.oyun.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.oyun.gotoAndStop(2)});
yanMenu.oyun.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.oyun.gotoAndStop(1)});
function oyunButonFonksiyon(e:MouseEvent) {
	icerikGetir("SWF/oyun.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//sozluk
yanMenu.sozluk.addEventListener(MouseEvent.CLICK,sozlukButonFonksiyon);
yanMenu.sozluk.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.sozluk.gotoAndStop(2)});
yanMenu.sozluk.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.sozluk.gotoAndStop(1)});
function sozlukButonFonksiyon(e:MouseEvent) {
	icerikGetir("SWF/sozluk.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//sinav
yanMenu.sinav.addEventListener(MouseEvent.CLICK,sinavButonFonksiyon);
yanMenu.sinav.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.sinav.gotoAndStop(2)});
yanMenu.sinav.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.sinav.gotoAndStop(1)});
function sinavButonFonksiyon(e:MouseEvent) {
	icerikGetir("SWF/sinav.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
//konular
yanMenu.konular.addEventListener(MouseEvent.CLICK,konularButonFonksiyon);
yanMenu.konular.addEventListener(MouseEvent.MOUSE_OVER,function(){yanMenu.konular.gotoAndStop(2)});
yanMenu.konular.addEventListener(MouseEvent.MOUSE_OUT,function(){yanMenu.konular.gotoAndStop(1)});
function konularButonFonksiyon(e:MouseEvent) {
	icerikGetir("SWF/konular.swf");
	menuKapatZamanlayici = setInterval(yanMenuKapat,1);
}
/////////////////////////////////////////////////