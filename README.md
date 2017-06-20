
Minimal R package: glasgowcoma
==============================

R Programming 수강생 여러분들께

Glasgow Coma Scale을 참고하거나 간단한 계산을 할 수 있는 패키지입니다.

`roxygen2` 패키지를 사용하면 문서 작업을 쉽게 할 수 있습니다.

설치는 다음과 같이 하면 됩니다.

``` r
install.pacakges("devtools")
devtools::install_github("shanmdphd/glasgowcoma")
```

실행은 다음과 같이 하면 됩니다.

``` r
library(glasgowcoma)
glasgowComaScale
```

| ID  | Class  |  Score| Value                                                      |
|:----|:-------|------:|:-----------------------------------------------------------|
| E1  | Eye    |      1| Does not open eyes                                         |
| E2  | Eye    |      2| Opens eyes in response to painful stimuli                  |
| E3  | Eye    |      3| Opens eyes in response to voice                            |
| E4  | Eye    |      4| Opens eyes spontaneously                                   |
| V1  | Verbal |      1| Makes no sounds                                            |
| V2  | Verbal |      2| Incomprehensible sounds                                    |
| V3  | Verbal |      3| Utters incoherent words                                    |
| V4  | Verbal |      4| Confused disoriented                                       |
| V5  | Verbal |      5| Oriented converses normally                                |
| M1  | Motor  |      1| Makes no movements                                         |
| M2  | Motor  |      2| Extension to painful stimuli (decerebrate response)        |
| M3  | Motor  |      3| Abnormal flexion to painful stimuli (decorticate response) |
| M4  | Motor  |      4| Flexion / Withdrawal to painful stimuli                    |
| M5  | Motor  |      5| Localizes painful stimuli                                  |
| M6  | Motor  |      6| Obeys commands                                             |

``` r
reportgcs() # Defualt argument
```

    ## [1] "GCS 15 = E4 V5 M6 at 2017-06-20 18:11:36 Normal or Minor brain injury suspected"

``` r
reportgcs(eye = 4, verbal = 4, motor = 4)
```

    ## [1] "GCS 12 = E4 V4 M4 at 2017-06-20 18:11:36 Moderate brain injury suspected"

``` r
reportgcs(simplify = FALSE) # Full report
```

    ## $summary
    ## [1] "GCS 15 = E4 V5 M6 at 2017-06-20 18:11:36"
    ## 
    ## $analysis
    ## [1] "Normal or Minor brain injury suspected"
    ## 
    ## $description
    ##    ID  Class Score                       Value
    ## 4  E4    Eye     4    Opens eyes spontaneously
    ## 9  V5 Verbal     5 Oriented converses normally
    ## 15 M6  Motor     6              Obeys commands

``` r
reportgcs(3, 3, 4, now = "2017-01-01 11:25", simplify = FALSE) # custom time
```

    ## $summary
    ## [1] "GCS 10 = E3 V3 M4 at 2017-01-01 11:25"
    ## 
    ## $analysis
    ## [1] "Moderate brain injury suspected"
    ## 
    ## $description
    ##    ID  Class Score                                   Value
    ## 3  E3    Eye     3         Opens eyes in response to voice
    ## 7  V3 Verbal     3                 Utters incoherent words
    ## 13 M4  Motor     4 Flexion / Withdrawal to painful stimuli

``` r
reportgcs(verbal = 2.5) # Error
```

    ## Error in reportgcs(verbal = 2.5): Only integer is acceptable.

``` r
reportgcs(verbal = "erlk") # Error
```

    ## Error in reportgcs(verbal = "erlk"): Only integer is acceptable.

`roxygen2` 패키지를 사용하면 문서 작업을 쉽게 할 수 있습니다. 각 함수의 앞에 `#'` 으로 시작하는 주석을 각각 달고 다음의 함수를 실행하면 `NAMESPACE`와 `Rd` 파일을 자동으로 고쳐줍니다. 직접 Rd 파일을 수정하는 것보다 간소하다고 많은 사람들이 말하곤 합니다.

``` r
library(roxygen2)
roxygenize()
```
