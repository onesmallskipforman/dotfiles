# helpful links:
# https://www.reddit.com/r/NixOS/comments/r9544v/importing_home_manager_module_for_nur_with_nix/
# probably the most useful: https://discourse.nixos.org/t/using-nur-in-nixos-configuration-via-flakes/51221/3
# https://gvolpe.com/blog/nix-flakes/
# https://discourse.nixos.org/t/how-to-setup-nur-with-home-manager-and-flakes/29216/2
# https://github.com/Misterio77/nix-config/blob/4f13f7e5bb47a009a7f669f544cd64a4a8bdc173/flake.nix
# https://github.com/Misterio77/nix-config/blob/4f13f7e5bb47a009a7f669f544cd64a4a8bdc173/home/gabriel/features/desktop/common/firefox.nix
# https://www.reddit.com/r/NixOS/comments/15zkfj1/simple_homemanager_firefox_setup/
# https://gitlab.com/usmcamp0811/dotfiles/-/blob/fb584a888680ff909319efdcbf33d863d0c00eaa/flake.nix
# https://nur.nix-community.org/repos/rycee/
# https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/5
# https://discourse.nixos.org/t/combining-best-of-system-firefox-and-home-manager-firefox-settings/37721
# https://github.com/GideonWolfe/nix/blob/66bb39c24fc34b25626cea375b25fa2c0eac4f4e/configs/modules/configs/user/firefox/firefox.nix#L66
# https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager
# https://www.chrisportela.com/posts/home-manager-flake/
# https://github.com/Evertras/simple-homemanager/blob/main/02-basic/flake.nix
# https://nur.nix-community.org/repos/rycee/
# https://nixos.asia/en/howto/local-flake-input
# https://discourse.nixos.org/t/flake-input-from-local-git-repo/27609/2
{
  pkgs,
  ...
}: {
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    profiles.skipper = {
      userChrome = ./userChrome.css;
      userContent = ./userContent.css;
      extensions = {
        packages = with pkgs.repos.rycee.firefox-addons; [
          # comments represent addons missing from rycee
          darkreader
          facebook-container
          # igplus
          news-feed-eradicator
          ublacklist
          ublock-origin
          # ultimadark
          # unhook youtube
          # unhook for reddit
        ];
        force = true;
      };
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.startup.homepage" = "www.crouton.net";
        "extensions.autoDisableScopes" = 0;
        "extensions.update.autoUpdateDefault" = false;
        "extensions.update.enabled" = false;
        "browser.startup.page" = 1;
        "browser.newtabpage.enabled" = false;
        "browser.tabs.hoverPreview.enabled" = false;
        "browser.tabs.hoverPreview.showThumbnails" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.theme.content-theme" = 0;
      };
    };
  };
}
