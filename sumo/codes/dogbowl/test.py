
def main():
    #a bunch of constants of this script (URL, OP, HEADER...)
    from sumoconst import URL1, YEAR, MONTH
    #make the variations of sumo stats data
    variations = [x+y for x in YEAR for y in MONTH]
    URL1 = URL1
    print URL1
if __name__ == "__main__":
    main()
