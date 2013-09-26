--                              -*- Mode: Ada -*-
--  Filename        : sdl-versions.ads
--  Description     : Library version information.
--  Author          : Luke A. Guest
--  Created On      : Thu Sep 26 13:46:42 2013
package SDL.Versions is
   type Version_Level is mod 2 ** 8 with
     Size       => 8,
     Convention => C;

   --  TODO: Check this against the library, as they use an int.
   type Revision_Level is mod 2 ** 32;

   type Version is
      record
         Major : Version_Level;
         Minor : Version_Level;
         Patch : Version_Level;
      end record with
        Convention => C;

   --  These allow the user to determine which version of SDLAda they compiled with.
   Compiled_Major : constant Version_Level with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_Ada_Major_Version";

   Compiled_Minor : constant Version_Level with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_Ada_Minor_Version";

   Compiled_Patch : constant Version_Level with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_Ada_Patch_Version";

   Compiled : constant Version := (Major => Compiled_Major, Minor => Compiled_Minor, Patch => Compiled_Patch);

   function Revision return String with
     Inline => True;

   function Revision return Revision_Level;

   procedure Linked_With (Info : in out Version);
end SDL.Versions;