# Contributing to Atom

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to reptyr and its packaging, which are hosted in [this GitHub repository](https://github.com/nelhage/reptyr). These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Code of Conduct

This project and everyone participating in it is governed by the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [nelhage@nelhage.com](mailto:nelhage@nelhage.com).

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for reptyr. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out [the required template](.github/ISSUE_TEMPLATE.md), the information it asks for helps us resolve issues faster.

**Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

* **Perform a [cursory search](https://github.com/nelhage/reptyr/issues?q=is%3Aissue)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). If you've encountered behavior by reptyr that you can't explain and have done your best to troubleshoot it using Google, create an issue and provide the following information by filling in [the template](.github/ISSUE_TEMPLATE.md).

Explain the problem and include additional details to help developers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started reptyr (e.g. which command exactly you used in the terminal). When listing steps, **don't just say what you did, but explain how you did it**.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. If you use the keyboard while following the steps, **record the GIF with [key-mon](https://github.com/critiqjo/key-mon) running**. You can use [this tool](https://github.com/phw/peek) or [this tool](https://www.maartenbaert.be/simplescreenrecorder/) on Linux.
* **If you're reporting that reptyr crashed**, include a stack trace. Include the stack trace in the issue in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines), a [file attachment](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/), or put it in a [gist](https://gist.github.com/) and provide link to that gist.
* **If the problem is related to performance or memory**, include a [perf CPU profile capture](http://www.brendangregg.com/perf.html) with your report.

Provide more context by answering these questions:

* **Did the problem start happening recently** (e.g. after updating to a new version of your distribution, desktop environment or reptyr) or was this always a problem?
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:

* **Which version of reptyr do you have installed?** You can get the exact version by running `reptyr -v` in your terminal, and the command `whereis reptyr` will inform you of all copies of reptyr that are present in your $PATH directories (if there's more than one, definitely mention that).
* **What's the name and version of the OS you're using**?
* **Are you running reptyr in a virtual machine?** If so, which VM software are you using and which operating systems and versions are used for the host and the guest?
* **Which keyboard layout are you using?** Are you using a US layout or some other layout?

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for reptyr, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). Fill in [the template](.github/ISSUE_TEMPLATE.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting An Enhancement Suggestion

* **Perform a [cursory search](https://github.com/nelhage/reptyr/issues?q=is%3Aissue)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined that your enhancement suggestion hasn't already been made/discussed, create an issue and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you wished was possible instead** and why.
* **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of reptyr which the suggestion is related to. You can use [this tool](https://github.com/phw/peek) or [this tool](https://www.maartenbaert.be/simplescreenrecorder/) on Linux.
* **Explain why this enhancement would be useful** to most reptyr users.
* **Which version of reptyr do you have installed?** You can get the exact version by running `reptyr -v` in your terminal.
* **Specify the name and version of the OS you're using.**

### Pull Requests

Please follow these steps to have your contribution considered by the maintainers:

* Follow all instructions in [the template](.github/PULL_REQUEST_TEMPLATE.md)
* Follow the [styleguides](#styleguides)

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional work, tests, or other changes before your pull request can be ultimately accepted.

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :non-potable_water: `:non-potable_water:` when plugging memory leaks
    * :memo: `:memo:` when writing docs
    * :bug: `:bug:` when fixing a bug
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :lock: `:lock:` when dealing with security
