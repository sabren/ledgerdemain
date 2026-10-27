# sabren/ledgerdemain

> "Magical ledger utilities" (the GitHub description): a 2008
> experiment at a jQuery-based HTML frontend for the ledger
> text-based accounting program. One branch, 7 commits, all written
> across two days (2008-08-26 → 2008-08-27), and never touched
> again. The app itself never got past a "hello world" WSGI stub.
> Repo: https://github.com/sabren/ledgerdemain — public, 2 stars,
> single `master` branch. **Verdict: probably not useful anymore —
> the tickler's own assessment holds up. Keep as a historical
> snapshot only; do not revive it.**

## Inventory

36 files on `master`, in four groups:

**The app itself (5 files, all stubs or scaffolding):**

- `README` — the whole design statement: "Ledgerdemain is a simple
  jquery based html frontend for ledger," where ledger is "an awesome
  text-based accounting package" (linked in the README to
  http://www.newartisans.com/software/ledger.html — that URL was
  not checked). It says ledger's XML output is ill-formed and to
  use `./led2xml` to generate clean XML, and gives Paste/PasteScript
  setup instructions (host 127.0.0.1, port 8099).
- `demain.py` — the entire application: a WSGI function returning
  "hello world" as plain text. It imports a module called `platonic`
  that is **not in the repo**, so even this stub would not import
  as-is. The final commit message calls it "a 'hello world' wsgi
  server" — that is an accurate description, not modesty.
- `demain.paste.in` — PasteDeploy config template: Paste HTTP
  server on 127.0.0.1:8099, `demain:app_factory`.
- `led2xml` — a one-line shell script: `ledger -f $1 xml | sed
  s/en:/en-/g | sed s/tr:/tr-/g` — a workaround for the ill-formed
  XML the README mentions.
- `ledger.xsl` — an XSLT 1.0 stylesheet turning ledger XML into an
  HTML table with columns Date, Eff Date, Clr?, Party, Account,
  Amount, Balance.

**The frontend (6 files):**

- `reconcile.xhtml` — a "reconciler" page importing `reconcile.css`,
  the flexigrid CSS, jQuery 1.2.6, jQuery UI, jQuery DOM, Sarissa
  (with an IE XPath emulation), jquery.xslTransform, flexigrid,
  and a jsUnit test suite — whose test functions are empty
  (`test_makeCard` has no body). The page's script section
  contains no application logic beyond the empty test stubs.
- `reconcile.css` — page styles.
- `jquery-1.2.6.js`, `jquery-dom.js`, `jquery.ui.all.js`,
  `jquery.xslTransform.js`, `prototype-1.6.0.2.js`, `sarissa.js`,
  `sarissa_ieemu_xpath.js` — vendored third-party JavaScript
  libraries of the era. The README itself flags: "@TODO: track down
  licenses on all the javascript packages."

**Vendored flexigrid (23 files):**

- `flexigrid/flexigrid.css`, `flexigrid/flexigrid.pack.js`, and
  21 GIF/PNG button and background images — a complete copy of
  the flexigrid grid widget, including Dreamweaver sync metadata
  (`_notes/dwsync.xml`) pointing at a `hydrogen.sabren.com`
  server path. This is the bulk of the repo by file count and is
  entirely third-party code.

## Why it is not useful anymore

- **It never worked as an app.** The last commit is the hello-world
  stub. There is no ledger-data display code, no reconciliation
  logic, and the one test file is empty. Nothing here ever ran
  against real ledger data as far as the repo shows.
- **Every dependency is 18 years stale.** jQuery 1.2.6, Prototype
  1.6.0.2, Paste/PasteScript via `easy_install`, XSLT 1.0 in the
  browser via Sarissa, Python 2-era WSGI code — the whole stack is
  from 2008, and the README's own setup path (`ez_setup.py` from
  peak.telecommunity.com) no longer exists as a live route.
- **The idea itself is superseded.** A web frontend for ledger
  (now Ledger CLI / hledger / Beancount territory) is a solved
  problem many times over, and this repo contributes no working
  piece toward one — not even a parser, since `led2xml` just shells
  out to the `ledger` binary.
- **The one arguably reusable artifact, `ledger.xsl`, is trivial:**
  a single table template with fixed column widths. Not worth
  extracting on its own.

## What is unverified

- The GitHub repo page shows `updatedAt` 2019-08-13, but the clone
  contains no commits after 2008-08-27 and no other refs. That
  2019 date is most likely a metadata change (visibility, transfer,
  or similar), but the repo itself does not say — flagged, not
  assumed.
- Whether the ledger program at the README's newartisans.com URL
  still exists there — not checked.
- The licenses of the vendored JavaScript packages — the README
  says they were never tracked down. If the repo were ever
  published or reused, that TODO would still be open.

## Verdict

**Keep as history, do not revive — and the honest assessment is
that it is probably not useful anymore, as the tickler suggested.**
Nothing in it runs, nothing in it is reusable without a rewrite,
and the idea it gestures at has better implementations elsewhere.
The reason to keep rather than delete is only that it is small,
public, and a record of a 2008 experiment — the same reason to
leave it exactly as it is. No archive action is proposed here:
archiving is blocked for sabren repos (tangentstorm has push-only
access, no admin), and a two-day-old stub does not need an archive
decision forced on it.

---

## From the original README (preserved verbatim)

```

ABOUT
-----

Ledgerdemain is a simple jquery based html frontend for ledger.

Legder is an awesome text-based accounting package available from:
    
    http://www.newartisans.com/software/ledger.html


USING
-----

Ledger's xml output is ill-formed xml at the moment.

Use "./led2xml filename.led" to generate clean xml. 


WEB SERVER
----------

Uses python and wsgi.

You probably want easy_install if you don't have it:

   wget http://peak.telecommunity.com/dist/ez_setup.py
   python ez_setup.py

Then:

   easy_install Paste PasteDeploy PasteScript
   cp demain.paste.in demain.paste
   
   # (edit host/port in demain.paste if you want)
   
   paster demain.paste



LICENSE
-------

my code is freely available under the terms of the BSD license
(same license as ledger)


@TODO: track down licenses on all the javascript packages.

```
