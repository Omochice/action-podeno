import JSON5 from "npm:json5@2.2.3";
import { err, ok, Result, ResultAsync } from "npm:neverthrow@8.2.0";
import { dirname } from "jsr:@std/path@1.1.1/dirname";
import { as, is, type PredicateType } from "jsr:@core/unknownutil@4.3.0";
import { execPodium } from "https://raw.githubusercontent.com/Omochice/podeno/refs/tags/v2.0.0/src/lua.ts";

const toError = (message = "Unexpected error") => {
  return (e: unknown) => {
    if (e instanceof Error) return e;
    return new Error(message, { cause: e });
  };
};

const isConfig = is.ObjectOf({
  type: is.UnionOf([is.LiteralOf("markdown"), is.LiteralOf("vimdoc")]),
  in: is.String,
  out: is.String,
  autoMkdir: as.Optional(is.Boolean),
});

const isConfigArray = is.ArrayOf(
  isConfig,
);

const safeReadTextFileSync = Result.fromThrowable(
  Deno.readTextFileSync,
  toError("Unexpected readTextFileSync error"),
);

const safeParse = Result.fromThrowable(
  JSON5.parse,
  toError("Unexpected parse error"),
);

const convertPod = (config: PredicateType<typeof isConfig>) => {
  return safeReadTextFileSync(config.in)
    .asyncAndThen((content) => {
      return execPodium(content, config.type);
    })
    .andThen((content) => {
      return ok({
        content,
        out: config.out,
        autoMkdir: config.autoMkdir ?? false,
      });
    });
};

const main = async (args: string[]) => {
  const configString = args[0];
  if (configString === undefined) {
    throw new Error("Config must be specified.");
  }

  await safeParse(configString)
    .andThen((configs: unknown) => {
      if (!isConfigArray(configs)) {
        return err(new Error("config invalid shape"));
      }
      return ok(configs);
    })
    .asyncAndThen((configs) => {
      return ResultAsync.combine(configs.map(convertPod));
    })
    .match(
      (outputs) => {
        outputs.forEach(({ content, out, autoMkdir }) => {
          if (autoMkdir) {
            Deno.mkdirSync(dirname(out), { recursive: true });
          }
          Deno.writeTextFileSync(out, content);
        });
      },
      (e) => {
        throw e;
      },
    );
};

if (import.meta.main) {
  await main(Deno.args);
}
