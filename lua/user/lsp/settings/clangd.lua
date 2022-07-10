return {
  cmd = {
    "clangd",
    "--background-index",
		"--clang-tidy",
		"--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
		"--completion-style=detailed",
		"--cross-file-rename=true",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
		"--function-arg-placeholders=false",
		"--log=verbose",
		"--ranking-model=decision_forest",
		"--header-insertion-decorators",
		"-j=12",
		"--pretty",
  }
}

-- NOTE: generate a .clangd-tidy file under project root dir to enable this feature
-- Checks: "*,
--         -abseil-*,
--         -altera-*,
--         -android-*,
--         -fuchsia-*,
--         -google-*,
--         -llvm*,
--         -modernize-use-trailing-return-type,
--         -zircon-*,
--         -readability-else-after-return,
--         -readability-static-accessed-through-instance,
--         -readability-avoid-const-params-in-decls,
--         -cppcoreguidelines-non-private-member-variables-in-classes,
--         -misc-non-private-member-variables-in-classes,
-- "
-- WarningsAsErrors: ''
-- HeaderFilterRegex: ''
-- FormatStyle:     none

