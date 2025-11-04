"""
This file will not load pylsp automatically.  Unknown reason.  Start LSP with LspStart
"""

import datetime
from datetime import date, time, timedelta, tzinfo


# import json


# from string import hexdigits


class TestClass:

    def print_date(self, foo: str, bar: int):
        """
        Prints today's datetime
        """
        print(datetime.date.today())

    def print_date_string(self):
        """
        Prints today's datetime as string
        """
        print(datetime.date.today().isoformat())

    def __init__(self):
        pass


def print_date(foo: str, bar: int):
    print(datetime.date.today())


t = TestClass()
t.print_date_string()


def print_time():
    print(datetime.datetime.now())


def print_yesterday():
    today = datetime.date.today()
    yesterday = today - datetime.timedelta(days=1)
    print(yesterday)


def print_next_seven_days():
    today = datetime.date.today()
    for i in range(1, 8):
        next_day = today + datetime.timedelta(days=i)
        print(next_day)

    for i in range(7):
        next_day = today + datetime.timedelta(days=i + 1)
        print(next_day)
    print_date("boo", 1)


def print_next_week():
    """Prints the date one week from today."""
    today = datetime.date.today()
    next_week = today + datetime.timedelta(weeks=1)
    print(next_week)


def foo(arg1: str = "x", arg2: int = 1, arg3: list = None) -> list:
    arg3 = arg3 or []
    return_list = arg3.extend([arg1] * arg2)
    return return_list


def colocol():
    print("s;asdfklasdf;lkasdkflk;sdfja;lksdjfal;ksdfjalksjdfa;lksjdfalksjdf;alksjdfd;flkajs;dflkjasl;dkfjasdlfajsdizj")


def bar():
    pass
    # TODO: test todos
    # WARNING: test warning
    # TEST: test here
    for i in range(10):
        print(i)
    s = {x for x in range(10) if x > 5}


def foo2(x: str) -> list:
    if len(x) >= 1:
        return [1, 2, 3]
    return []


def main(x: str, y: int = None, z: str = None):
    print(x)
    # now = datetime.date().today()

    dict = {value for value in range(10)}

    print("The quick BROWN test fox jumped over the lazy dog")
    print("The quick BROWN fox jumped over the lazy dog")
    print("The quick BROWN test fox jumped over the lazy dog")
    print(dict)

    for i in range(1, 10):
        print(i)

    foolist = foo2("a")

    if foolist:
        print(str("hello"))
    print()

    for n in range(1, 10, 2):
        print()(n)


if __name__ == "__main__":
    # main("sample string")
    print(foo())
    pass
