class System
{
   private static var isWindows:Bool = ~/^win/i.match(Sys.systemName());

   // https://github.com/vegardit/haxe-files
   public static function touch(path:String):Int
   {
      if(isWindows)
      {
         path = path.split("/").join("\\");
         return Sys.command('copy /b "$path"+,, "$path" >nul 2>&1'); // https://superuser.com/a/764721
      }
      else
         return Sys.command('touch "$path"');
   }
}