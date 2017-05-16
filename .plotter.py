import matplotlib.pyplot as plt
import numpy as np
from math import *


def plotit(f, n=100, a=0, b=10):
    xs = np.arange(a, b, (b-a)/n)
    ys = [f(x) for x in xs]
    plt.plot(xs, ys)


def ask(name):
    arg_str = input(name + '> ')
    return eval(arg_str)


while True:
    try:
        fstr = input('f> ')
        if fstr == 'exit':
            exit()
        elif fstr == 'show':
            plt.show()
        elif fstr == 'more':
            n = ask('n')
            a = ask('a')
            b = ask('b')

            fstr = input('f> ')
            f = eval('lambda x: ' + fstr)

            plotit(f, n, a, b)
        else:
            f = eval('lambda x: ' + fstr)
            plotit(f)

    except (SyntaxError, TypeError, NameError) as err:
        print(err)
    except KeyboardInterrupt:
        exit()
    except EOFError:
        exit()
