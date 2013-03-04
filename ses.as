package 
{
	import fl.events.SliderEvent;
	public class ses
	{
		public var sesNesnesi:Sound;
		public var sesKanali:SoundChannel;
		public var trans:SoundTransform;
		public var aktifSes:String;
		public var aktifSiddet:Number = 0.5;
		public var aktifDenge:Number = 0;
		public function ses()
		{
			// constructor code
		}
		
		function sesac(ses:String)
		{//sesi oynatmaya başlayan fonksiyon
			aktifSes = ses as String;
			if (sesNesnesi != null)
			{
				sesKanali.stop();
			}
			sesNesnesi = new Sound();
			sesNesnesi.load(new URLRequest("" + aktifSes + ""));


			sesKanali = new SoundChannel  ;
			trans = new SoundTransform(aktifSiddet,aktifDenge);
			sesKanali = sesNesnesi.play();
			sesKanali.soundTransform = trans;
			siddetLabel.text="" + int(aktifSiddet * 100) + "";
		}


		//sesAyar.addEventListener(SliderEvent.CHANGE, volumeChange);


		function volumeChange(e:SliderEvent):void
		{
			aktifSiddet = e.target.value;
			siddetLabel.text="" + int(aktifSiddet * 100) + "";
			trans.volume = aktifSiddet;
			sesKanali.soundTransform = trans;
		}
	}

}