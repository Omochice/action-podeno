# action-podeno

Run [podeno](https://github.com/Omochice/podeno) in your github action.

## usage

```yml
jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: Omochciw/actions-podeno@v0
        with:
          # config: { type: "markdown" | "vimdoc", in: string, out: string, autoMkdir?: boolean }[]
          #   type: Convert target type.
          #   in: Input file path.
          #   out: Output file path.
          #   autoMkdir: Whether make output parent directory. (default: false)
          config: |
            [
              { type: "markdown", in: "README.pod", out: "README.md", },
            ]
      # If you want to auto commit...
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: "docs: update docs"
          branch: ${{ github.head_ref }}
```
