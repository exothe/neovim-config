local ls = require("luasnip")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = extras.rep

-- typescript snippets
ls.config.set_config({
	history = false,
	region_check_events = { "CursorMoved" },
})
ls.add_snippets("typescript", {
	s("log", { t("console.log("), i(1), t(");") }),
	s("component", {
		t("export function "),
		f(function(args, snip)
			local name = snip.env.TM_FILENAME
			i, _ = string.find(name, "%.")
			return string.sub(name, 1, i - 1)
		end, {}),
		t({
			"() {",
			"\t",
		}),
		i(1),
		t({ "", "}" }),
	}),
	s(
		"useState",
		fmt(
			[[
        const [\/, set\/] = React.useState<\/>(\/);
        ]],
			{
				i(1),
				f(function(args)
					return args[1][1]:gsub("^%l", string.upper)
				end, { 1 }),
				i(2),
				i(3),
			},
			{
				delimiters = "\\/",
			}
		)
	),
	s(
		"zodSchema2Type",
		fmt(
			[[
        export type \/ = z.infer<typeof \/>;
        ]],
			{
				i(1),
				rep(1),
			},
			{
				delimiters = "\\/",
			}
		)
	),
	s(
		"sleep",
		fmt(
			[[
        await ((ms: number) => new Promise((r) => setTimeout(r, ms)))(\/);
        ]],
			{
				i(1),
			},
			{
				delimiters = "\\/",
			}
		)
	),

	s(
		"electron-preload-function",
		fmt(
			[[
        \/(
            ...params: Parameters<typeof \/>
        ): ReturnType<typeof \/> {
            return ipcRenderer.invoke('\/', ...params);
        },
        ]],
			{
				i(1),
				rep(1),
				rep(1),
				rep(1),
			},
			{
				delimiters = "\\/",
			}
		)
	),
	s(
		"electron-main-function",
		fmt(
			[[
            ipcMain.handle('\/', (_, ...params: Parameters<typeof \/>) =>
                \/(...params),
            );
          ]],
			{
				i(1),
				rep(1),
				rep(1),
			},
			{
				delimiters = "\\/",
			}
		)
	),
	s(
		"react-context-with-state",
		fmt(
			[[
import React from 'react';

export interface \/State {
    \/
}

export const \/Context = React.createContext<{
    \/State: \/State;
    set\/State: React.Dispatch<React.SetStateAction<\/State>>;
} | null>(null);

export function \/ContextProvider({ children }: React.PropsWithChildren) {
    const [\/State, set\/State] = React.useState<\/State>({
        \/
    });

    return <\/Context.Provider value={{ \/State, set\/State }}>{children}<//\/Context.Provider>;
}

export function use\/Context() {
    const context = React.useContext(\/Context);

    if (context === null) {
        throw Error('\/Context used without a provider');
    }
    return context;
}
        ]],
			{
				rep(1),
				i(2),
				i(1),
				f(function(args)
					return args[1][1]:gsub("^%l", string.lower)
				end, { 1 }),
				rep(1),
				rep(1),
				rep(1),

				rep(1),
				f(function(args)
					return args[1][1]:gsub("^%l", string.lower)
				end, { 1 }),
				rep(1),
				rep(1),
				i(3),
				rep(1),
				f(function(args)
					return args[1][1]:gsub("^%l", string.lower)
				end, { 1 }),
				rep(1),
				rep(1),

				rep(1),
				rep(1),
				rep(1),
			},
			{
				delimiters = "\\/",
			}
		)
	),
})

ls.filetype_set("typescriptreact", { "typescript" })
ls.filetype_set("astro", { "typescript" })

-- latex snippets
ls.add_snippets("tex", {
	s({ trig = "ize", dscr = "Itemize environment" }, {
		t({
			"\\begin{itemize}",
			"    \\item ",
		}),
		i(1),
		t({
			"",
			"\\end{itemize}",
		}),
	}),
	s({ trig = "enum", dscr = "Enumerate environment" }, {
		t({
			"\\begin{enumerate}",
			"    \\item ",
		}),
		i(1),
		t({
			"",
			"\\end{enumerate}",
		}),
	}),
	s(
		{ trig = "fig", dscr = "A figure environment with caption and label." },
		fmt(
			[[
            \begin{figure}
                \centering
                \includegraphics[width=\textwidth]{<>}
                \caption{<>}
                \label{fig:<>}
            \end{figure}
          ]],
			{
				i(1),
				i(2),
				rep(1),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		{ trig = "subfig", dscr = "A figure environment that contains subfigures with caption and label." },
		fmt(
			[[
            \begin{figure}
                \centering
                \begin{subfigure}[t]{0.45\textwidth}
                    \centering
                    \includegraphics[width=\textwidth]{<>}
                    \caption{<>}
                    \label{fig:<>}
                \end{subfigure}
                \hfill
                \begin{subfigure}[t]{0.45\textwidth}
                    \centering
                    \includegraphics[width=\textwidth]{<>}
                    \caption{<>}
                    \label{fig:<>}
                \end{subfigure}
                \caption{<>}
                \label{fig:<>}
            \end{figure}
          ]],
			{
				i(1),
				i(2),
				rep(1),
				i(3),
				i(4),
				rep(3),
				i(5),
				i(6),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		{ trig = "\\align", dscr = "An align environment." },
		fmt(
			[[
            \begin{align}
                <>
            \end{align}
          ]],
			{
				i(1),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		{ trig = "table", dscr = "A table environment with caption and label." },
		fmt(
			[[
            \begin{table}
                \centering
                \begin{tabular}{<>}
                    <>
                \end{tabular}
                \caption{<>}
                \label{table:<>}
            \end{table}
          ]],
			{
				i(1),
				i(0),
				i(2),
				i(3),
			},
			{
				delimiters = "<>",
			}
		)
	),
})
