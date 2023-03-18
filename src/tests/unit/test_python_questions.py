from src.python_questions import check_brackets, selection_sort


def test_check_brackets_correct_sequence():
    # arrange
    s = "(({[]}))"

    # act
    is_balanced = check_brackets(s)
    
    # assert
    assert is_balanced

def test_check_brackets_incorrect_number_of_brackets():
    # arrange
    s = "(({[]))"

    # act
    is_balanced = check_brackets(s)
    
    # assert
    assert not is_balanced

def test_check_brackets_incorrect_order_close_before_open():
    # arrange
    s = ")({}"

    # act
    is_balanced = check_brackets(s)
    
    # assert
    assert not is_balanced


def test_check_brackets_incorrect_order_parentheses_instead_of_square():
    # arrange
    s = "([)]"

    # act
    is_balanced = check_brackets(s)
    
    # assert
    assert not is_balanced


def test_selection_sort():
    # arrange
    arr = [10,5,7,1,3,2]

    # act
    new_arr = selection_sort(arr)
    
    # assert
    assert new_arr == [1,2,3,5,7,10]