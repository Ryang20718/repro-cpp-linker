# Copyright (c) 2021 Waabi Innovation. All rights reserved.

"""Wrap files into a single directory."""

def _impl(ctx):
    # https://stackoverflow.com/a/76552840
    outdir = ctx.actions.declare_directory(ctx.attr.name)
    args = ctx.actions.args()
    args.add(outdir.path)
    args.add_all(ctx.files.srcs)
    ctx.actions.run_shell(
        outputs = [outdir],
        inputs = ctx.files.srcs,
        arguments = [args],
        command = """
outdir="$1";
shift;
cp "$@" "${outdir}"
                """,
    )
    return [
        DefaultInfo(files = depset([outdir])),
    ]

dir = rule(
    _impl,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
        ),
    },
)
