const watch = process.argv.includes("--watch") && {
  onRebuild(error) {
    if (error) console.error("[watch] build failed", error);
    else console.log("[watch] build finished");
  },
};

require("esbuild").build({
  entryPoints: ["app/javascript/application.js"],
  outdir: "app/assets/builds",
  bundle: true,
  minify: true,
  watch: watch,
  plugins: [],
}).catch(() => process.exit(1));