import { parse } from "https://deno.land/std@0.200.0/jsonc/parse.ts";
import { ensure, is, type PredicateType } from "npm:unknownutil@3.11.0";
import { err, ok, type Result } from "npm:neverthrow@6.1.0";

const isConfig = is.ArrayOf(is.ObjectOf({
  type: is.OneOf([is.LiteralOf("markdown"), is.LiteralOf("vimdoc")]),
  in: is.String,
  out: is.String,
}));

export function loadConfig(
  path: string,
): Result<PredicateType<typeof isConfig>, Error> {
  const loaded = Deno.readTextFileSync(path);
  try {
    return ok(ensure(parse(loaded), isConfig));
  } catch (e: unknown) {
    return err(new Error("Failed to configuration file", { cause: e }));
  }
}
