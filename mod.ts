// import { summary } from "npm:@actions/core@1.10.1";
import JSON5 from "npm:json5@2.2.3";
import { err, ok, Result, ResultAsync } from "npm:neverthrow@6.1.0";
import { ensure, is } from "https://deno.land/x/unknownutil@v3.11.0/mod.ts";
import { execPodium } from "https://pax.deno.dev/Omochice/podeno@v1.0.0-1/src/lua.ts";

const toError = (message = "Unexpected error") => {
  return (e: unknown) => {
    if (e instanceof Error) return e;
    return new Error(message, { cause: e });
  };
};

const safeEnsure = Result.fromThrowable(ensure, toError());
const isConfig = is.ArrayOf(
  is.ObjectOf({
    type: is.OneOf([is.LiteralOf("markdown"), is.LiteralOf("vimdoc")]),
    in: is.String,
    out: is.String,
  }),
);

const main = async (args: string[]) => {
  const safeParse = Result.fromThrowable(
    JSON5.parse,
    toError(),
  );
  const configString = args[0];
  if (configString === undefined) {
    throw new Error("Config must be specified.");
  }

  const configArray = safeParse(configString)
    .andThen((configs: unknown) => {
      if (!isConfig(configs)) {
        return err(new Error("config invalid shape"));
      }
      return ok(configs);
    });
  if (configArray.isErr()) {
    throw configArray.error;
  }

  configArray.value.forEach(async (config) => {
    await execPodium(
      Deno.readTextFileSync(config.in),
      config.type,
    ).match(
      (s) => console.log(s),
      (e) => {
        throw e;
      },
    );
  });
  // .andThen((configs) => {
  //   ResultAsync.combine(configs.map((config) => {
  //     execPodium(
  //       Deno.readTextFileSync(config.in),
  //       config.type,
  //     );
  //   }));
  // });
};

await main(Deno.args);

// console.log("hi this is from docker");

// console.log(JSON5.parse(Deno.args[0]));

// // summary.addRaw("## header\n\nthis is message.").write();

// Deno.writeTextFileSync("sample.txt", "this is sample.text");
