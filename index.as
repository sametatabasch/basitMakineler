fscommand("allowscale", "false");//Birden fazla fscommand yazınca  sadece son yazılanı  çalıştırıyor
import flash.events.MouseEvent;//hizliMenu için 
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
		menuAcKapatZamanlayıci = setInterval(menuAc,0)
	}
	else if (hizliMenu.yukariAsagiButon.currentFrame==5)
	{
		menuAcKapatZamanlayıci = setInterval(menuKapat,0);
	}
}

var menuAcKapatZamanlayıci
function baslaKapatMousesiz()
{
	menuAcKapatZamanlayıci = setInterval(menuKapat,0);
}
function menuAc():void
{
	hizliMenu.maske.height +=  5;
	if (hizliMenu.maske.height >= 370)
	{
		clearInterval(menuAcKapatZamanlayıci);
	}
	hizliMenu.yukariAsagiButon.gotoAndStop(5);
}
function menuKapat():void
{
	hizliMenu.maske.height -=  5;
	if (hizliMenu.maske.height <= 1)
	{
		clearInterval(menuAcKapatZamanlayıci);
	}
	hizliMenu.yukariAsagiButon.gotoAndStop(1);
}

hizliMenu.vida.addEventListener(MouseEvent.CLICK,icerikGetir1);
function icerikGetir1(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/1.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 1;
}
hizliMenu.cark.addEventListener(MouseEvent.CLICK,icerikGetir2);
function icerikGetir2(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/2.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 2;
}
hizliMenu.cikrik.addEventListener(MouseEvent.CLICK,icerikGetir3);
function icerikGetir3(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/3.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 3;
}
hizliMenu.tekerlek.addEventListener(MouseEvent.CLICK,icerikGetir4);
function icerikGetir4(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/4.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 4;
}
hizliMenu.kaldirac.addEventListener(MouseEvent.CLICK,icerikGetir5);
function icerikGetir5(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/5.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 5;
}
hizliMenu.egikduzlem.addEventListener(MouseEvent.CLICK,icerikGetir6);
function icerikGetir6(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/6.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 6;
}
hizliMenu.makara.addEventListener(MouseEvent.CLICK,icerikGetir7);
function icerikGetir7(e:MouseEvent)
{
	MovieClip(root).icerikGetir("SWF/7.swf");
	baslaKapatMousesiz();
	MovieClip(root).icerikNo = 7;
}
/////////////////////////////////////////////////