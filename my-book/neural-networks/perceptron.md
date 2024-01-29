# Perceptron

```{graphviz}
digraph G {
  A -> B [texlbl="$x_1$"];
}
```

```{graphviz}
digraph G {
    A [label="\(x^2 + y^2 = r^2\)"];
    B [texlbl="$E=mc^2$"];
    A -> B;
}
```

```{tikz}
\begin{tikzpicture}
  \node[draw,circle] (A) at (0,0) {$x_1$};
  \node[draw,circle] (B) at (2,0) {$x_2$};
  \node[draw,circle] (C) at (1,-1) {$x_3$};
  \draw[->] (A) -- (B);
  \draw[->] (B) -- (C);
  \draw[->] (C) -- (A);
\end{tikzpicture}
```

## What is a perceptron?

### Synonyms

- Artificial neuron
- Mathematical function (What :open_mouth:? Really :astonished: ?)

```{admonition} Fun fact
:class: tip

Perceptrons were developed in the 1950s and 1960s by the scientist Frank Rosenblatt, inspired by
earlier work by Warren McCulloch and Walter Pitts.

[Perceptrons]
```

[Perceptrons]: http://neuralnetworksanddeeplearning.com/chap1.html#perceptrons

### Graphical representation

A **perceptron** is just a bunch of binary inputs and one binary output as you can see below. 

```{graphviz}
digraph G {
  rankdir=LR;

  node [shape=plaintext, margin=0]
  x1 [texlbl="$x_1$"];
  x2 [label="\\x_2"];
  x3 [label="x3"];

  splines=false;
  node [shape=circle, style=none, color=lightblue];
  edge [color=gray];

  f [label=""];

  x1 -> f
  x2 -> f
  x3 -> f

  node [shape=plaintext, margin=0]

  output [label="output"]

  f -> output
}
```

The weights $w_i$ are just real numbers that express how important is an input
$x_i$ to the $output$. The bigger the weight, the more important the input is to
the output.

### Mathematical representation

Here is how you compute the output of a perceptron:

$$
output = 
  \begin{cases} 
    1 & \text{if } \sum_j w_j x_j \geq threshold \\ 
    0 & \text{if } \sum_j w_j x_j \lt  threshold
  \end{cases}
$$

The $threshold$ is a real number that represents the minimum amount of "activation" needed for the perceptron to fire.

### Example of a perceptron

Decide if I will go skiing or not based on the weather.


Let's choose three factors as binary variables $x_1$, $x_2$ and $x_3$:

- $x_1$ - Is it snowing? (0 = no, 1 = yes)
- $x_2$ - Will my friends go? (0 = no, 1 = yes)
- $x_3$ - Is it near public transport? (0 = no, 1 = yes)

Let's choose the weights $w_1$, $w_2$ and $w_3$:

- The weather matters the most, so $w_1 = 6$.
- Will my friends go? Not so important, so $w_2 = 2$.
- Is it near public transport? Not so important either, so $w_3 = 2$.

Let's choose the threshold?

- How willing am I to go skiing?

  - Not so willing! Then ... high $threshold$.
    - $threshold = 8$, it means I go skiing only if it is snowing and either my friends go or it is near public transport.

  - Very willing! Then ... low $threshold$.
    - $threshold = 2$, it means I go skiing even if it is not snowing, but either my friends go or it is near public transport.

Let's represent this perceptron graphically:

```{graphviz}
digraph G {
  rankdir=LR;

  node [shape=plaintext, margin=0]
  x1 [label="x1 - Is it snowing?"];
  x2 [label="x2 - Will my friends go?"];
  x3 [label="x3 - Is it near public transport?"];

  splines=false;
  node [shape=circle, style=none, color=lightblue];
  edge [color=gray];

  f [label=""];

  node [shape=plaintext, margin=0]
  output [label="Will I go?"]

  x1 -> f [label="w1=6"]
  x2 -> f [label="w2=2"]
  x3 -> f [label="w3=2"]

  f -> output
}
```

Create a latex representation of the perceptron that has three inputs and one output. The perceptron
is represented by a circle and the inputs are represented by the nodes $x_1$, $x_2$ and $x_3$.

### Complex network of perceptrons

Complex neural networks can engage in sophisticated decision making.

```{graphviz}
digraph G {
  rankdir=LR;
  bgcolor=transparent;

  node [shape=point, margin=0]
  i1 [label="i1"];
  i2 [label="i2"];
  i3 [label="i3"];

  splines=false;
  node [shape=circle, style=none, color=lightblue];
  edge [color=gray];

  x1 [label=""];
  x2 [label=""];
  x3 [label=""];

  h1 [label=""];
  h2 [label=""];
  h3 [label=""];
  h4 [label=""];

  y [label=""];

  i1 -> x1
  i2 -> x1
  i3 -> x1

  i1 -> x2
  i2 -> x2
  i3 -> x2

  i1 -> x3
  i2 -> x3
  i3 -> x3

  x1 -> h1; x1 -> h2; x1 -> h3; x1 -> h4;
  x2 -> h1; x2 -> h2; x2 -> h3; x2 -> h4;
  x3 -> h1; x3 -> h2; x3 -> h3; x3 -> h4;

  h1 -> y; h2 -> y; h3 -> y; h4 -> y;
}
```

How can we represent this network mathematically?

- First let's simplify the notation:
  - $\sum_j w_j x_j$ becomes $w \cdot x$, where $w$ is the vector of weights and $x$ is the vector of inputs.
  - $-threshold$ becomes $b$, where $b$ is the bias.
- Then let's rewrite the mathematical representation of the perceptron:

$$
output = 
  \begin{cases} 
    0 & \text{if } w \cdot x + b \leq 0 \\
    1 & \text{if } w \cdot x + b \gt 0
  \end{cases}
$$

What is the meaning of the bias $b$, now?

- The bias is a measure of how easy it is to get the perceptron to output a 1.
- High bias means it's easy for the perceptron to output a 1.

## How can this help me understand better the Neural Networks?

TODO
