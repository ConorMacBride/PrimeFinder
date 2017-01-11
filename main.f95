PROGRAM primefinder

IMPLICIT NONE
REAL :: i
INTEGER :: j,no,lenlist
REAL, ALLOCATABLE :: list(:), list2(:)

ALLOCATE(list(3))
list = (/ 2.,3.,5. /)
i = 7                               ! Start at 7 to avoid special cases of 2 and 5  (See 32 -> 35)

DO WHILE (i <= 100000)                 ! Find no prime numbers >100
    j = 2                           ! Start from prime 3 as even numbers excluded
    no = 0                          ! Assume prime
    lenlist = SIZE(list)
    DO WHILE (j <= lenlist)          ! Loop through list of previous primes
        IF (MODULO(i,list(j)) == 0 .or. i / list(j) < 0.5) THEN ! Not a prime if remainder is 0 or div. is <0.5
            j = lenlist                 ! Break from DO if list(j) not a prime
            no = 1                      ! Indicate not a prime
        END IF
        j = j + 1
    END DO
    IF (no == 0) THEN               ! If i is a prime add it to the list
        ALLOCATE(list2(lenlist))    ! Allocate, swap and reallocate
        list2 = list
        DEALLOCATE(list)
        ALLOCATE(list(lenlist + 1))
        list(:lenlist) = list2
        DEALLOCATE(list2)
        list(lenlist+1) = i         ! Finally, add new prime, i, to list of correct length
    END IF
    i = i + 2                       ! Skip even numbers to make more efficient
    IF (MODULO(i,5.0) == 0) THEN    ! Skip multiples of 5 ""
        i = i + 2
    END IF
END DO

PRINT *,INT8(list)                        ! Output the list of primes
END PROGRAM  primefinder
