# My journey on AI

This is about my journey on AI. I will try to cover as much ground as possible so that I will be able to understand the concepts and apply them in real life.

I know this is a tough journey but is something I always wanted to do. And you know that unless you start you will never be able to finish it.

So let's start and fix some goals. For each goal I will document my journey and the resources I used to achieve it.

## Goals

- [ ] Read the free online book [Neural Networks and Deep Learning]

## Tools

- vscode

### Graphviz

I use [Graphviz][graphviz] for drawing graphs as I learn. 

In order to use it you need to install it:

```bash
sudo apt install graphviz
```

[graphviz]: https://graphviz.org/

### Sphinx extensions

These extensions are used in order to render the graphs in the documentation.

#### `sphinxcontrib-mermaid`

#### `spinxcontrib-tikz`

Install prerequisites:

```bash
sudo apt install texlive-xetex
```

Run the following command to install it:

```bash
pip install sphinxcontrib-tikz
```

### `inotifywait`

This tool is used to implement hot reload for the Jupyter Book.

```
sudo apt install inotify-tools
```

This tool helps me write the documentation for my journey.

[Neural Networks and Deep Learning]: http://neuralnetworksanddeeplearning.com/
