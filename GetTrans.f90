Subroutine GetTrans(n,E,f)
   !use Declaration
    implicit none

    integer, intent(in)     ::  n
    real(8), intent(out)    ::  E(n), f(n)

    integer                 ::  i

    read(10,*,end=2) (E(i), f(i), i = 1,n)
2   close(10)
    
   !write(6,'(f8.4,e12.4)') (E(i), f(i), i = 1,n)

End Subroutine GetTrans
