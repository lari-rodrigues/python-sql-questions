def check_brackets(s):

    brackets_dict = {
        "(": ")",
        "{": "}",
        "[": "]",
    }
    queue = []

    for c in s:
        if c in brackets_dict.keys():
            queue.append(brackets_dict[c])
        elif c in brackets_dict.values():
            # queue is empty or the char isn't the expected bracket - not balanced
            if not queue or c != queue.pop():
                return False
    return not queue

def selection_sort(arr):
    for i in range(len(arr)):
        min_element = i
        # loop through all elements and get the new min_element
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[min_element]:
                min_element = j
        # switch elements
        arr[i], arr[min_element] = arr[min_element] , arr[i]

    return arr

if __name__ == '__main__':
    s = [5,4,1]
    selection_sort(s)
