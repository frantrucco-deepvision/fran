import subprocess
import os
import tkinter as tk
from tkinter import font


MD_FILENAME = '/home/fran/bin/logger/db.md'
PATH = '/home/fran/bin/logger/db'


class InputBox(tk.Tk):
    def __init__(self, title, label_text=None):
        super().__init__()

        self.title(title)

        if label_text is not None:
            label_text = self.shorten_text(label_text, 100)
            self.geometry("1000x100")
            myFont = font.Font(family='Courier', size=10, weight='bold')
            task = tk.Label(self, text=label_text, bg="#1c2833", fg="#3498db",
                            pady=10, font=myFont)
            task.pack(side=tk.TOP, fill=tk.X)
        else:
            self.geometry("1000x40")

        myFont = font.Font(family='Courier', size=20, weight='bold')
        self.task_create = tk.Text(self, height=3, fg="#3498db", bg="#1c2833",
                                   font=myFont)

        self.task_create.pack(side=tk.TOP, fill=tk.X)
        self.task_create.focus_set()

        self.bind("<Return>", self.get_text)

    def get_text(self, event=None):
        text = self.task_create.get(1.0, tk.END).strip()
        self.text = text
        self.destroy()

    def shorten_text(self, text, max_chars):
        ellipsis = ' ...'
        text = text.replace('\n', ' /')
        answer = text
        if len(text) > max_chars:
            if max_chars < len(ellipsis):
                answer = ellipsis
            else:
                answer = text[:max_chars - len(ellipsis)] + ellipsis
        return answer


def get_category(entry):
    inputBox = InputBox('Input Category', entry)
    try:
        inputBox.mainloop()
        category = inputBox.text
    except:
        exit()
    if len(category) == 0:
        category = 'others'

    return category


def get_entry():
    inputBox = InputBox('Input Entry')
    try:
        inputBox.mainloop()
        entry = inputBox.text
    except:
        exit()
    return entry


def get_selected_text():
    proc = subprocess.Popen(['xsel', '-p'],
                            stdout=subprocess.PIPE,
                            universal_newlines=True)
    text = proc.stdout.read()
    return text


if __name__ == '__main__':
    os.chdir(PATH)
    entry = get_selected_text()
    if entry.strip(' \n\t') is '':
        entry = get_entry()
    category = get_category(entry)

    category = category.title().replace(" ", "")
    with open(category, 'a+') as f:
        f.write(entry + '\n')
