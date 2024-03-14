def _impl(ctx):
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
