{
  lib,
  rustPlatform,
  fetchFromGitHub,
  versionCheckHook,
  nix-update-script,
  cosmic-comp,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cos-cli";
  version = "0.3.1-git";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "cos-cli";
    rev = "17986886bfc82605e0728a024efae845e4391750";
    hash = "sha256-gFiG3iGHxzLL3ULFQRfghpaeXxMljZHS/MWaCQI5oxg=";
  };

  cargoHash = "sha256-dH1EzqLBTh0+IJfMCeNpKWi2CMmufqybM3BvsqiIpNc=";

  doInstallCheck = true;

  # TODO
  # nativeInstallCheckInputs = [ versionCheckHook ];
  # versionCheckProgram = #"${placeholder "out"}/bin/cos-cli";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A CLI utility for COSMIC Wayland toplevel and workspace management";

    # TODO
    # changelog = "https://github.com/cosmic-utils/cosmic-ctl/releases/tag/v${finalAttrs.version}";

    homepage = "https://github.com/estin/cos-cli";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ hiro98 ];
    mainProgram = "cos-cli";
    inherit (cosmic-comp.meta) platforms;
  };
})
