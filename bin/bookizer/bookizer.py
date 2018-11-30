from pprint import pprint
from math import ceil


def compute_number_of_blank_pages(total_pages, sheets_per_signature):
    remaining_pages = total_pages % (sheets_per_signature * 4)
    correct_remaining_pages = ceil(remaining_pages / 4) * 4
    return correct_remaining_pages - remaining_pages


def compute_sheets_last_signature(total_pages, sheets_per_signature):
    remaining_pages = total_pages % (sheets_per_signature * 4)
    correct_remaining_pages = ceil(remaining_pages / 4) * 4
    return correct_remaining_pages // 4


def create_signature_numbering(start=1, sheets_per_signature=6):
    Cs = [2 * i + 2 for i in range(sheets_per_signature)]
    Ds = [4*sheets_per_signature - 1 - 2*i for i in range(sheets_per_signature)]
    As = [i + 1 for i in Ds]
    Bs = [i - 1 for i in Cs]

    As = [i + (start - 1) for i in As]
    Bs = [i + (start - 1) for i in Bs]
    Cs = [i + (start - 1) for i in Cs]
    Ds = [i + (start - 1) for i in Ds]

    result = []
    for i in range(sheets_per_signature):
        result.append(As[i])
        result.append(Bs[i])
        result.append(Cs[i])
        result.append(Ds[i])

    return result


def create_book_numbering(total_pages, sheets_per_signature=6):
    number_of_signatures = total_pages // (sheets_per_signature * 4)

    book_numbering = []
    for i in range(number_of_signatures):
        start = 4 * i * sheets_per_signature + 1
        book_numbering += create_signature_numbering(start, sheets_per_signature)

    start = 4 * number_of_signatures * sheets_per_signature + 1

    sheets_last_signature = compute_sheets_last_signature(total_pages,
                                                          sheets_per_signature)

    book_numbering += create_signature_numbering(start, sheets_last_signature)

    return book_numbering


if __name__ == '__main__':
    try:
        total_pages = int(input("Total number of pages: "))
        sheets_per_signature = int(input("Number of sheets per signature: "))
    except:
        print("Something is wrong!")
        exit()

    print('')
    number_of_blank_pages = compute_number_of_blank_pages(total_pages, sheets_per_signature)
    print('Number of blank pages: {}'.format(number_of_blank_pages))

    print('')
    print('Book Numbering')
    print('--------------')
    book_numbering = create_book_numbering(total_pages, sheets_per_signature)
    print(', '.join(map(str, book_numbering)))
