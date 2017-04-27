import matplotlib.pyplot as plt
import numpy as np

def plotit(x, y, label=""):
    plt.scatter(np.array(list(x)), np.array(list(y)), label=label,
                alpha=0.5)


if __name__ == '__main__':

    order = input("N: ")
    corpus_opt = input("corpus name: ")
    log_probs = eval(input("dictionary:"))

    log_probs = sorted(log_probs.items())

    plotit(log_probs.keys(), log_probs.values(), "N={}".format(order))

    plt.legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.)

    plt.title('Log Probabilities of "{}" corpus'.format(corpus_opt))

    plt.xlabel('Gamma')
    plt.ylabel('Log Probability')

    plt.show()
