import subprocess
import os
import tkinter as tk
from tkinter import font


MD_FILENAME = '/home/fran/bin/logger/db.md'
PATH = '/home/fran/bin/logger'


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


class Table():
    def __init__(self):
        self.data = {}

    def add_entry(self, entry, category):
        category = category.lower().capitalize()
        if category not in self.data:
            self.data[category] = []

        self.data[category].append(entry)

    def to_org_mode(self):
        answer = ''
        for category, entries in self.data.items():
            answer += '\n## {}\n'.format(category)
            for entry in entries:
                answer += '```\n'
                answer += '{}'.format(entry)
                answer += '\n```\n\n'
        return answer

    @classmethod
    def from_org_mode(cls, orgfile):
        table = cls()
        reading_entry = False
        category = None
        for line in orgfile:
            if line.startswith('## ') and not reading_entry:
                category = line[len('## '):-1]
            elif line.startswith('```') and not reading_entry:
                reading_entry = True
                entry = ''
            elif line.startswith('```') and reading_entry:
                reading_entry = False
                assert category is not None, 'Bad markdown file'

                table.add_entry(entry[:-1], category)
                print('"{}"'.format(category))
            elif reading_entry:
                entry += line

        return table

    def save(self):
        org = '# MyStuff DB\n\n' + self.to_org_mode()
        with open(MD_FILENAME, 'w') as f:
            f.write(org)

    def load():
        try:
            with open(MD_FILENAME, 'r') as f:
                table = Table.from_org_mode(f)
        except AssertionError as error:
            raise error
        except:
            table = Table()
        return table


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
    table = Table.load()
    entry = get_selected_text()
    if entry.strip(' \n\t') is '':
        entry = get_entry()
    category = get_category(entry)
    table.add_entry(entry, category)
    table.save()
