defmodule NervesSystem3DS.MixProject do
  use Mix.Project

  @app :nerves_system_3ds
  @version Path.join(__DIR__, "VERSION")
           |> File.read!()
           |> String.trim()

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.4",
      compilers: Mix.compilers() ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: [loadconfig: [&bootstrap/1]],
      docs: [extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    []
  end

  defp bootstrap(args) do
    System.put_env("MIX_TARGET", "3ds")
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  defp nerves_package do
    [
      type: :system,
      # build_runner: Nerves.Artifact.BuildRunners.Docker,
      artifact_sites: [
        # {:prefix, "file:///my_artifacts/"}
        {:github_releases, "ConnorRigby/#{@app}"}
      ],
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.0", runtime: false},
      {:nerves_system_br, "1.4.5", runtime: false},
      # {:nerves_system_br, github: "nerves-project/nerves_system_br", runtime: false, override: true},
      {:nerves_toolchain_arm_unknown_linux_gnueabihf, "1.1.0", runtime: false},
      {:nerves_system_linter, "~> 0.3.0", runtime: false},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp description do
    """
    Nerves System - Nintendo 3DS
    """
  end

  defp package do
    [
      maintainers: ["Connor Rigby"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/nerves-project/#{@app}"}
    ]
  end

  defp package_files do
    [
      "fwup_include",
      "rootfs_overlay",
      "CHANGELOG.md",
      "fwup-revert.conf",
      "fwup.conf",
      "arm9linuxfw.bin",
      "boot.firm",
      "LICENSE",
      "linux-4.12.defconfig",
      "mix.exs",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "README.md",
      "VERSION"
    ]
  end
end
