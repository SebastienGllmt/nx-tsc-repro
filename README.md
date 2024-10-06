# TSC executor error repo

1. Run `pnpm nx build` and note there is no compiler error
2. Go to [the source file](./packages/shared/data-types/src/index.ts) and note this code obviously should not compile
3. Go inside your [node_modules](./node_modules/@nx/js/src/executors/tsc/tsc.impl.js) and pass `_options.tsConfig` into `checkDependencies` and it now property runs the JS file and errors like it should
