#' @title   Convert  \code{.xlsx} File
#' of \strong{\emph{Jafroc}}
#'  into \R object
#'
#'@description
#'\strong{\emph{Convert an FROC dataset}}
#'\describe{
#'\item{ \strong{\emph{from}}    }{ \code{.xlsx} file of \strong{\emph{Jafroc}}  }
#'\item{ \strong{\emph{into}}    }{ \R object   }
#'}
#'
#'
#'@details
# Create a   dataset to  be passed into the
#  function \code{ \link{fit_Bayesian_FROC}}.

#'Convert an Excel file whose extension
#'is \code{.xlsx} of Jafroc format to
#'   an \R object representing FROC data.
#    to which we will apply functions in
#     this package such as  \code{\link{fit_Bayesian_FROC}()}.
#'

#'@param  No.of.Modalities A positive integer, indicating the number of \emph{modalities} for FROC data-set in \code{.xlsx} file.
#'@param No.of.readers  A positive integer, indicating the number of \emph{readers}  for FROC data-set  in an \code{.xlsx} file.
#'@param No.of.confidence.levels  A positive integer, indicating the number of \emph{confidence levels}  for FROC data-set in \code{.xlsx} file.
#'@param debug A logical, whether, inner objects in function is push out into global environment or not.
#'@references Bayesian Models for Free-response
#' Receiver Operating Characteristic Analysis,pre-print
#'@return A list, representing FROC data.
#'@details
#' The return values include a
#'  list which can be passed to the  function \code{fit_Bayesian_FROC}.
#' For data of Jafroc, running this function,
#'   we immediately can fit the author's Bayesian
#'   FROC model to this return value.
#'
#' The Jafroc software's format consists of
#'  suspicious locations marked by readers and true locations.
#' Such data is \emph{redundant} for our
#'  Bayesian statistical models.
#' So, we reduce the information of data to the number of
#' false positives and number of hits for
#'  each confidence levels by this function.
#'
#'
#'
#' Data can be calculated from the following
#' Jafroc data, in which there are more information than TP and FP.
#' In fact, in the Jafroc data, the FP and TP are counted for each images, each lesions etc.
#' So, it has more information.
#'
#'
#'   It causes limitation of our model.
#' So, our model start to fit a model to
#' the reduced data from Jafroc. So,
#'  the redunction will cause the non accuracy
#'   evaluation of the observer performance.
#' The future research I should start the
#' Jafroc formulation.
#'
#'
#'
#'@format The \code{.xlsx} file of Jafroc
#'consists of three sheets named \strong{\emph{TP, FP, Truth}}, \strong{\emph{ precisely! Correctly! }}
#'(other names never be permitted !!)
#'
#'
#'\strong{\emph{-----------------------------------  TP ------------------------------------------}}
#'
#'
#'A sheet named \strong{\emph{TP}}  consists of five columns \strong{\emph{ precisely }}  named from the right hand side:
#'
#'\strong{\emph{ReaderID,	ModalityID,	CaseID,	LesionID,	TP_Rating.}}
#'
#'
#'\strong{\emph{NOTE.}}
#'\describe{
#'\item{  \strong{\emph{CaseID}}            }{  Note that the above word \strong{\emph{CaseID}} means the Image ID vectors indicating the ID of radiographs.  That is "case = image = radiograph".}
#'\item{ \strong{\emph{the first row}}      }{  Note that the first row of each sheat of \code{.xlsx} file is constructed by the names of column as follows:   }
#'}
#'
#'\strong{An Example of the sheet named \emph{TP} in a \emph{\code{.xlsx}} file for the \emph{Jafroc} software}
#'
#'
#'\strong{ Interpretation of table}
#'
#' Throughout this explanation, we follow the convention that readers are male.
#'
#' For example,
#' the first row means
#' the first reader (ReaderID=1) correctly find
#' the first lesion (LesionID = 1)
#' in the first image (CaseID = 1)
#' taken by the first modality (ModalityID = 1)
#' with his rating 5 (TP_Rating =5).
#'
#' Similarly,
#' the second row means
#' the first reader (ReaderID=1) correctly find
#' the 4-th lesion (LesionID = 4)
#' in the second image (CaseID = 2)
#' taken by the 2-nd modality (ModalityID = 2)
#' with his rating 4 (TP_Rating = 4).
#'
#'
#'
#' \tabular{ccccc}{
#'   ReaderID \tab   ModalityID   \tab   CaseID \tab   LesionID \tab   TP_Rating.\cr
#'   -------------------\tab-------------------\tab-------------------\tab-------------------\tab------------------\cr
#'   1 \tab 1 \tab 1 \tab  1\tab 5\cr
#'   1 \tab 2 \tab 2  \tab 1\tab 4\cr
#'   1 \tab 3 \tab 4  \tab 1\tab 5\cr
#'   1 \tab 1 \tab 8  \tab 1\tab 3\cr
#'   1 \tab 2 \tab 8  \tab 2\tab 4\cr
#'   1 \tab 3 \tab 9  \tab 1\tab 4\cr
#'   1 \tab 1 \tab 9  \tab 2\tab 3\cr
#'   1 \tab 2 \tab 9  \tab 3\tab 5\cr
#'   1 \tab 3 \tab 11 \tab 1\tab 3\cr
#'   2 \tab 1 \tab 1 \tab  1\tab 4\cr
#'   2 \tab 2 \tab 4  \tab 1\tab 4\cr
#'   2 \tab 3 \tab 5  \tab 1\tab 4\cr
#'   2 \tab 1 \tab 8  \tab 1\tab 1\cr
#'   2 \tab 2 \tab 8  \tab 2\tab 2\cr
#'   2 \tab 3 \tab 8  \tab 3\tab 2\cr
#'   2 \tab 1 \tab 10  \tab 1\tab 3\cr
#'   2 \tab 2 \tab 10 \tab 2\tab 2\cr
#'   2 \tab 3 \tab 11  \tab 1\tab 2\cr
#'
#'   : \tab : \tab :  \tab :\tab :\cr
#'   : \tab : \tab :  \tab :\tab :\cr    }
#'
#'
#'\strong{\emph{-----------------------------------  FP ------------------------------------------}}
#'
#'
#'

#' A sheet named \strong{FP}  consists of four columns  \strong{\emph{ precisely }}
#'  named from the right hand side: \strong{ReaderID,	ModalityID,	CaseID,	FP_Rating}
#'\strong{An Example of a sheet named FP in a \code{.xlsx} file for the Jafroc software}
#'
#'
#'
#'
#'
#'
#'\strong{ Interpretation of table}
#'
#'
#' For example,
#' the first row means
#' the first reader (ReaderID=1) makes
#'  a false alarm location
#' in the first image (CaseID = 1)
#' taken by the first modality (ModalityID = 1)
#' with his rating 2 (TP_Rating =2).
#'
#' Similarly,
#' the second row means
#' the first reader (ReaderID=1) makes
#'  a false alarm location
#' in the second image (CaseID = 2)
#' taken by the 2-nd modality (ModalityID = 2)
#' with his rating 1 (TP_Rating = 1).
#'
#'
#' Similarly,
#' the 6-th and 7-th rows mean that
#' the first reader (ReaderID=1) makes
#'  two false alarm location
#' in the second patient (CaseID = 2).
#' The first false alarm  is in the image
#' taken by the 1-st modality (ModalityID = 1)
#' with his rating 1 (TP_Rating = 1).
#' The second false alarm  is in the image
#' taken by the 3-rd modality (ModalityID = 3)
#' with his rating 2 (TP_Rating = 2).
#'
#'
#'
#'
#'
#'
#' \tabular{cccc}{
#'   ReaderID \tab   ModalityID   \tab   CaseID  \tab   FP_Rating.\cr
#' -------------------\tab-------------------\tab-------------------\tab------------------\cr

#'   1 \tab 1 \tab 1 \tab   2\cr
#'   1 \tab 2 \tab 2  \tab  1\cr
#'   1 \tab 3 \tab 3  \tab  1\cr
#'   1 \tab 1 \tab 5  \tab  2\cr
#'   1 \tab 2 \tab 7 \tab   1\cr
#'   1 \tab 3 \tab 7  \tab   2\cr
#'   1 \tab 1 \tab 9  \tab   3\cr
#'   1 \tab 2 \tab 9  \tab   4\cr
#'   1 \tab 3 \tab 10 \tab   1\cr
#'   2 \tab 1 \tab 1 \tab    2\cr
#'   2 \tab 2 \tab 2  \tab   3\cr
#'   2 \tab 3 \tab 3  \tab   4\cr
#'   2 \tab 1 \tab 8  \tab   1\cr
#'   2 \tab 2 \tab 9  \tab  1\cr
#'   2 \tab 3 \tab 11  \tab   1\cr
#'   2 \tab 1 \tab 14  \tab  1\cr
#'   2 \tab 2 \tab 15 \tab   1\cr
#'   2 \tab 3 \tab 21  \tab   2\cr
#'   : \tab :  \tab :\tab :\cr
#'   : \tab :  \tab :\tab :\cr
#'      }
#'
#'
#'
#'
#'\strong{\emph{-----------------------------------  Truth ------------------------------------------}}

#'
#'A sheet named \strong{Truth }  consists of three columns
#' \strong{\emph{ precisely }}  named from the right
#'  hand side:\strong{CaseID,	LesionID,	Weight} .
#'
#'\strong{An Example of a sheet named Truth in a \code{.xlsx} file for the Jafroc software}
#'
#'
#'\strong{ Interpretation of table}
#'
#'For example, the first image (CaseID = 1) contains
#'three lesions each of which is named 1,2,3, namely LesionID = 1,2,3.
#'For example, the second image (CaseID = 2) contains
#'two lesions each of which is named 1,2, namely LesionID = 1,2.
#'For example, the third image (CaseID = 3) contains
#'a sinle lesion named 1, namely LesionID = 1.

#'
#' \tabular{ccc}{
#'   CaseID \tab   LesionID   \tab     Weight\cr
#'   -------------------\tab-------------------\tab------------------\cr

#'   1 \tab 1 \tab    0.3333...\cr
#'   1 \tab 2 \tab    0.3333...\cr
#'   1 \tab 3 \tab    0.3333...\cr
#'   2 \tab 1 \tab    0.5\cr
#'   2 \tab 2 \tab    0.5\cr
#'   3 \tab 1 \tab    1\cr
#'   4 \tab 1 \tab    0.25\cr
#'   4 \tab 2 \tab    0.25\cr
#'   4 \tab 3 \tab    0.25\cr
#'   4 \tab 4 \tab    0.25\cr
#'   5 \tab 1 \tab    0.5\cr
#'   5 \tab 2 \tab    0.5\cr
#'   6 \tab 1 \tab    0.3333...\cr
#'   6 \tab 2 \tab    0.3333...\cr
#'   6 \tab 3 \tab    0.3333...\cr
#'   7 \tab 1 \tab    0.3333...\cr
#'   7 \tab 2 \tab    0.3333...\cr
#'   7 \tab 3 \tab    0.3333...\cr
#'   8 \tab 1 \tab    0.25\cr
#'   8 \tab 2 \tab    0.25\cr
#'   8 \tab 3 \tab    0.25\cr
#'   8 \tab 4 \tab    0.25\cr
#'   :  \tab :\tab :\cr
#'   :  \tab :\tab :\cr
#'   }
#'
#'
#'
#'
#' Note that the weght are used
#' such that each image influences
#' a same effect on the esimates.
#' Without weight, the images including
#' many targets (lesions) will have very strong effect
#' on the estimates.
#' To avoid such bias, Jafroc uses weight.
#' In another context,
#' weight would be used to specify more important lesions in each image.
#'
#' In this package, we do not use the information of weight.
#'Since the theory of the author of this package did not consider such weight.
#' In the future I have to include the notion of weight.
#'Jafroc use the notion fo figure of metric as non parametric manner.
#'So, it seems difficult to include it in the Bayesian model,
#'since generally speaking, Bayesian methodology is parametric.
#'
#'@import readxl
#'
#'@seealso
#'Rjafroc, which is unfortunately not on CRAN, now  2019 Jun 19.
#' Or JAFROC software in the Chakarboty's Web page.
#' Unfortunately, this software is no longer supported.
#'

#'@examples
#'
# \dontrun{
#'## Only run examples in interactive R sessions
#'if (interactive()) {

# ####1#### ####2#### ####3#### ####4#### ####5#### ####6#### ####7#### ####8#### ####9####
#'#========================================================================================
#'#                  Example for convert the Jafroc data
#'#========================================================================================
#'
#' # Work Flow
#'
#' # step 0) Make an .xlsx file "JafrocDatasetExample.xlsx" as example data
#' #          to be passed to the function by interactive manner.
#' # step 1) Convert the "JafrocDatasetExample.xlsx" file to an R object
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#' # In the following code, when dialog box asks you to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in Working directory.
#'
#'
#' # This is important, so I write twice, again.
#'
#'
#' # In the following code, when dialog box asks you to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in Working directory.
#'
#'
#'
#' # In the following code, when dialog box asks you to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in Working directory.
#'
#'
#'
#'
#'
#'#========================================================================================
#'#         step 0)      Make a Jafroc data as an example dataset
#'#========================================================================================
#'
#'# If you can find the xlsx file named JAFROC_data.xlsx
#'# in the director "inst/extdata" of this package,
#'# Then this step 0) is redundant. The author prepares this example for the people who
#'# cannot find the xlsx file in the  "inst/extdata" of this package.
#' # Using an xlsx file ( which is named JAFROC_data.xlsx and
#' # included in the director "inst/extdata" of this package,)
#' # we can reconstruct it  as follows:(If someone can obtain the Excel file
#' # from the path tpfp/inst/extdata/JAFROC_data.xlsx, then the following code
#' # is not required to run, because the same xlsx file is created.
#'
#'
#'
#'
#' Truth <- readxl::read_excel(system.file("extdata",
#'  "JAFROC_data.xlsx",
#'   package="tpfp"),
#'    sheet = "Truth")
#'##### utils::View(Truth)
#'
#' TP <- readxl::read_excel( system.file("extdata",
#'                                       "JAFROC_data.xlsx",
#'                                        package="tpfp"),
#'                            sheet = "TP")
#'#### utils::View(TP)
#'
#' FP <- readxl::read_excel( system.file("extdata",
#'                                       "JAFROC_data.xlsx",
#'                                         package="tpfp"),
#'                           sheet = "FP")
#'#### utils::View(FP)
#'
#'
#'
#'
#'
#'sample <- list(TP=TP,FP=FP,Truth=Truth)
#'openxlsx::write.xlsx(sample,"JafrocDatasetExample.xlsx")
#'
#'  tcltk::tkmessageBox(
#'  message="A file named
#'
#'    JafrocDatasetExample.xlsx
#'
#'
#'  is created in the working directory")
#'
#'
#'# Now, we obtain an excel file named "JafrocDatasetExample.xlsx", which is same as
#'# the JAFROC_data.xlsx.
#'# whose format is available in the Jafroc software developed by Chakraborty.
#'# Note that if you have an excel file
#'# which is formulated correctolly  for our package,
#'# then the above process does not be required.
#'
#'
#'
#'
#'#    (0) From the above, we obtain  "JafrocDatasetExample.xlsx"
#'#    which is the multiple reader and multiple modality dataset
#'#    for Jafroc analysis which is Chakraborty's software Jafroc or the R package Rjafroc
#'#     but  NOT implemented in our package,.
#'
#'
#'
#'
#'#========================================================================================
#'#         step 1)      Convert the Jafroc data obtained in the above
#'#========================================================================================
#'
#'# (1) Using "JafrocDatasetExample.xlsx" as an example excel file,
#'# we run the function to convert the excel file from Jafroc format
#'# to our format:
#'
#'
#'      dataList <- convertFromJafrocCasewise(
#'                                   No.of.Modalities =5,
#'                                   No.of.readers    =4,
#'                                   No.of.confidence.levels = 5
#'                                    )
#'
#'
#'
#'# In the variable, there is no xlsx files, since it is selected by interactive manner.
#'# So, please select the xlsx file, i.e.,  "JafrocDatasetExample.xlsx"  obtained
#'# in step 0) or your own Jafroc  .xlsx file.
#'
#'

#'}### Only run examples in interactive R sessions
#'
#'
#           }#' \dontrun{

#'
#'
#' @export

convertFromJafrocCasewise <- function(
  No.of.Modalities,
  No.of.readers,
  No.of.confidence.levels,
  # No.of.images
  debug = FALSE
  ){


  M <- No.of.Modalities
  Q <- No.of.readers
  C <- No.of.confidence.levels
  # NI <- No.of.images




  ########### PASS ########## START
  message("* Please select a xlsx file to calculate its number of false alarms and true positives for each confidenve level.")
  message("* The lowest confidence level should be 1, not zero.")

  tcltk::tkmessageBox(message="
 * Select a Jafroc file whose extesion is .xlsx to be converted into an R object.

 * The return.value is used to calculate FROC bayesian model in this package by running the following code:

                      fit_Bayesian_FROC(return.value)")
  path<-tcltk::tclvalue(tcltk::tkgetOpenFile())
  if (!nchar(path)){
    tcltk::tkmessageBox(
      message="* No file was selected! \n* Exit. \n\n\n* I love you! \n\n\n* You are not alone,... \n  perhaps,...\n  piggy is with you \n  or doggy and doggy are with you,...  ")
    return(message("Suspend a process."))
  }else{
    xlsxfilename <- basename(path)

    tcltk::tkmessageBox(message=paste("* The selected file name:",xlsxfilename,".
* More precisely, its path is the follwing:\n", path, "."))
  }

  # path
  xlsxfilename <- basename(path)
  directoryname  <- dirname(path)
  ########### PASS ########## Fin







  message("\n \n \n \n Wait...")
  fileTP<-xlsx::read.xlsx(path, sheetIndex ="TP")
  message("\n  Wait...")
  fileFP<-xlsx::read.xlsx(path, sheetIndex ="FP")
  message("\n   Wait... \n\n\n")
  fileTruth<-xlsx::read.xlsx(path, sheetIndex ="Truth")


  if(min(fileTruth$CaseID) ==0)  NI <- max(fileTruth$CaseID) +1
  if(min(fileTruth$CaseID) ==1)  NI <- max(fileTruth$CaseID) +0
  if(min(fileTruth$CaseID) ==2)  NI <- max(fileTruth$CaseID) -1
  if(min(fileTruth$CaseID) ==3)  NI <- max(fileTruth$CaseID) -2

  minimal_CaseID <-  min(fileTruth$CaseID)
  maximal_CaseID <-  max(fileTruth$CaseID)

  # caseID_deseased -----------
  for (iii in 1:nrow(fileTruth)) {
    fileTruth_deseased_only <- fileTruth[ !(fileTruth$LesionID == 0),]
    # caseIDs_deseased <- fileTruth[ !(fileTruth$LesionID == 0),]
  }

  caseIDs_deseased <- unique(fileTruth_deseased_only$CaseID)
 # number_of_caseIDs_deseased

# NL_casewise----
  NL_casewise <-array(0,c(NI))

  for (caseid in minimal_CaseID:maximal_CaseID) {
    NL_casewise[caseid] <- max(fileTruth[fileTruth$CaseID==caseid,]$LesionID)

    }

  if(debug){
    my_global_env <- globalenv()
    my_global_env$NL_casewise <- NL_casewise
    print.data.frame( data.frame( NL_casewise= NL_casewise))
  }
  # head(fileTP )
  # head(fileFP )
  # head(fileTruth)
  # names(fileTP)
  # names(fileFP )
  # names(fileTruth)
  #
  #  C <- 5
  #  M<-5
  #  Q<-4
  # M <-max(max(fileTP$ModalityID),max( fileFP$ModalityID))
  # M <-as.integer (max(  max( fileFP$ModalityID)))
  # Q <-as.integer (max(  max( fileTP$ReaderID  )))

  if( min( c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )==0 ) NI <- max(c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )  +1
  if( min( c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )==1 ) NI <- max(c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )

  SRSC <-array(0,c(NI,M,Q,C))
  harray <-array(0,c(NI,M,Q,C))
  farray <-array(0,c(NI,M,Q,C))


  # if( min( c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )==1 ){

  for (iii in 1:nrow(fileTP)) {
    harray[  fileTP$CaseID[iii]  ,  fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ] <- 1+  harray[ fileTP$CaseID[iii]  , fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ]
  }
  for (iii in 1:nrow(fileFP)) {
    farray[  fileFP$CaseID[iii]  , fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ] <- 1+  farray[ fileFP$CaseID[iii]  , fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ]
  }

  # }else if( min( c( fileTP$CaseID,  fileTP$CaseID, fileTruth$CaseID) )==0 ){
  #   for (iii in 1:nrow(fileTP)) {
  #     harray[  fileTP$CaseID[iii] +1 ,  fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ] <- 1+  harray[ fileTP$CaseID[iii] +1 , fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ]
  #   }
  #   for (iii in 1:nrow(fileFP)) {
  #     farray[  fileFP$CaseID[iii] +1 , fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ] <- 1+  farray[ fileFP$CaseID[iii]  +1 , fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ]
  #   }
  #
  #
  #
  # }





  # m<- rep(1:M, each=C*Q)
  # m
  # q <-  rep(seq(1,Q,1), M, each=C)
  # q
  # c <-rep(rep(C:1), M*Q)
  # c



  a <- caseID_m_q_c_vector_from_NI_M_Q_C(NI = NI , M = M ,Q = Q, C = C )


  caseID <- a$caseID
  m <- a$m
  c <- a$c
  q <- a$q




  f <-array(0,c(NI*M*Q*C))
  f
  h <-array(0,c(NI*M*Q*C))
  h
  #
  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)
  for(case in 1:NI)
  for (mmm in 1:M) {

    for (qqq in 1:Q) {
      for (ccc in 1:C) {
        h[ (case -1 )*M*Q*C + (mmm-1)*Q*C+(qqq-1)*C+(C+1-ccc)] <-harray[case,mmm,qqq,ccc]
        f[ (case -1 )*M*Q*C + (mmm-1)*Q*C+(qqq-1)*C+(C+1-ccc)] <-farray[case,mmm,qqq,ccc]

      }}}

  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)





  yourdata <- data.frame(CaseID = caseID,
                         ModalityID=m,
                         ReaderID=q,
                         Confidence_lebels=c,
                         True_Positives=h,
                         False_Positives=f)


  print.data.frame(yourdata,row.names = F)

  if(debug){
    # my_global_env <- globalenv()

    my_global_env$h<-h
    my_global_env$f<-f
    my_global_env$harray<-harray
    my_global_env$farray<-farray

    my_global_env$h<-h
    my_global_env$f<-f
    my_global_env$M<-M
    my_global_env$Q<-Q
    my_global_env$C<-C
    my_global_env$m<-m
    my_global_env$q<-q
    my_global_env$c<-c
    my_global_env$n<-nrow(fileTP)
    my_global_env$NI<-NI

    length(h);length(f);  length(q);length(m)


    my_global_env$fileTP<-fileTP
    my_global_env$fileFP<-fileFP
    my_global_env$fileTruth<-fileTruth
    my_global_env$yourdata<-yourdata

  }



  # yourdata
  # nrow(yourdata)
  # nrow(yourdata)==M*Q*C
  message("\n \n wait .... \n")
  xlsx::write.xlsx(yourdata, file=paste(directoryname,"/converted_",xlsxfilename,sep=""), sheetName="TPsFPs", row.names=F)
  message(paste("* An excel file named  converted_",xlsxfilename," is made in the directory (",directoryname,"), in which the number of false positives and true positives are calcultated for your data (",xlsxfilename ,"). \n \n ",sep = ""))

#here ----


  # tcltk::tkmessageBox(
#     message=paste("
# * An excel file named
#
#
# converted_",xlsxfilename,"
#
# is made in the directory
#
#       ",directoryname,"
#
#   in which the number of false positives and true positives are calcultated for the
#
#                   ",xlsxfilename ,". \n \n ",sep = "")
    # )

  message("
* An excel file named


converted_",xlsxfilename,"

is made in the directory

      ",directoryname,"

  in which the number of false positives and true positives are calcultated for the

                  ",xlsxfilename ,". \n \n ",sep = "")


  #xlsx::write.xlsx(yourdata, file=paste(directoryname,"/trans... This / is important!! This is it in path !!


  # data.transformed <<- read.xlsx2(paste("transformed",xlsxfilename), 1, stringsAsFactors=FALSE)
  # message("2) A dataframe is made and named 'dataframe.transformed'.   \n")
  # message("--------------------------------------------------  \n")


  NL <- nrow(fileTruth)- nrow(subset(fileTruth ,fileTruth$LesionID ==0) )

# return -----
  dataList <- list(caseID=caseID,
                   NI=NI,
                   NI_deseased = length(caseIDs_deseased),
                   NL_casewise=NL_casewise,
                   caseIDs_deseased=caseIDs_deseased,
                   fileTruth_deseased_only=fileTruth_deseased_only,
                   fileTP=fileTP,
                   fileFP=fileFP,
                   fileTruth=fileTruth,
                   m=m,q=q,c=c,h=h,f=f, NL=NL, C=C,M=M,Q=Q,
                   harray=harray,farray=farray,df=yourdata)



  # results <- fastDummies::dummy_cols(df, select_columns = "ModalityID")
  # knitr::kable(results)



  # assign("dataList", dataList, envir=globalenv())
  message("* I love you 2019. Aug. 1. so,... please please me!  \n\n")

  message("* The retrun value is a list object which is available for model fitting by the fit_Bayesian_FROC().   \n\n")
  message("* If forget to restore the return value, then use the R object  [  .Last.value  ] in which the disired return value is retained.    \n\n")
  message("* For example, execute the R script [   fit <-  fit_Bayesian_FROC(.Last.value  )   ] in which the disired analysis will be done.    \n\n")

  message("--------------------------------------------------  \n")

  return(dataList)
  #
  # dataList.Chakra.Web$m==dataList.transformed$m
  # dataList.Chakra.Web$q==dataList.transformed$q
  # dataList.Chakra.Web$c==dataList.transformed$c
  # dataList.Chakra.Web$h==dataList.transformed$h
  # dataList.Chakra.Web$f==dataList.transformed$f
  # dataList.Chakra.Web$NL==dataList.transformed$NL
  # dataList.Chakra.Web$C==dataList.transformed$C
  # dataList.Chakra.Web$M==dataList.transformed$M
  # dataList.Chakra.Web$Q==dataList.transformed$Q






  #
  # m <- data.transformed$ModalityID
  # q <- data.transformed$ReaderID
  # c <- data.transformed$Confidence_lebels
  # h <- data.transformed$True_Positives
  # f <- data.transformed$False_Positives

  #
  #
  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)
  # N <-M*Q*C
  #
  #
  # m <-data$m
  # q <-data$q
  # c <-data$c
  # h <-data$h
  # f <-data$f
  # NL<-data$NL
  # C<-data$C
  # M<-data$M
  # Q<-data$Q
  #

}



#' @title   Convert  \code{.xlsx} File
#' of \strong{\emph{Jafroc}}
#'  into \R object
#'
#'@description
#'\strong{\emph{Convert an FROC dataset}}
#'\describe{
#'\item{ \strong{\emph{from}}    }{ \code{.xlsx} file of \strong{\emph{Jafroc}}  }
#'\item{ \strong{\emph{into}}    }{ \R object   }
#'}
#'
#'
#'@details
# Create a   dataset to  be passed into the
#  function \code{ \link{fit_Bayesian_FROC}}.

#'Convert an Excel file whose extension
#'is \code{.xlsx} of Jafroc format to
#'   an \R object representing FROC data
#    to which we will apply functions in
#     this package such as  \code{\link{fit_Bayesian_FROC}()}.
#'
#'Revised 2019 Jun 19
#'Revised 2019 Dec 13
#'@param  No.of.Modalities A positive integer, indicating the number of \emph{modalities} for FROC data-set in \code{.xlsx} file.
#'@param No.of.readers  A positive integer, indicating the number of \emph{readers}  for FROC data-set  in an \code{.xlsx} file.
#'@param No.of.confidence.levels  A positive integer, indicating the number of \emph{confidence levels}  for FROC data-set in \code{.xlsx} file.
#'@references Bayesian Models for Free-response
#' Receiver Operating Characteristic Analysis,pre-print
#'@return A list, representing FROC data.
#'@details
#' The return values include a
#'  list which can be passed to the  function \code{fit_Bayesian_FROC}.
#' For data of Jafroc, running this function,
#'   we immediately can fit the author's Bayesian
#'   FROC model to this return value.
#'
#' The Jafroc software's format consists of
#'  suspicious locations marked by readers and true locations.
#' Such data is \emph{redundant} for our
#'  Bayesian statistical models.
#' So, we reduce the information of data to the number of
#' false positives and number of hits for
#'  each confidence levels by this function.
#'
#'
#'
#' Data can be calculated from the following
#' Jafroc data, in which there are more information than TP and FP.
#' In fact, in the Jafroc data, the FP and TP are counted for each images, each lesions etc.
#' So, it has more information.
#'
#'
#'   It causes limitation of our model.
#' So, our model start to fit a model to
#' the reduced data from Jafroc. So,
#'  the redunction will cause the non accuracy
#'   evaluation of the observer performance.
#' The future research I should start the
#' Jafroc formulation.
#'
#'
#'
#'@format The \code{.xlsx} file of Jafroc
#'consists of three sheets named \strong{\emph{TP, FP, Truth}}, \strong{\emph{ precisely! Correctly! }}
#'(other names never be permitted !!)
#'
#'
#'\strong{\emph{-----------------------------------  TP ------------------------------------------}}
#'
#'
#'A sheet named \strong{\emph{TP}}  consists of five columns \strong{\emph{ precisely }}  named from the right hand side:
#'
#'\strong{\emph{ReaderID,	ModalityID,	CaseID,	LesionID,	TP_Rating.}}
#'
#'
#'\strong{\emph{NOTE.}}
#'\describe{
#'\item{  \strong{\emph{CaseID}}            }{  Note that the above word \strong{\emph{CaseID}} means the Image ID vectors indicating the ID of radiographs.  That is "case = image = radiograph".}
#'\item{ \strong{\emph{the first row}}      }{  Note that the first row of each sheat of \code{.xlsx} file is constructed by the names of column as follows:   }
#'}
#'
#'\strong{An Example of the sheet named \emph{TP} in a \emph{\code{.xlsx}} file for the \emph{Jafroc} software}
#'
#'
#'\strong{ Interpretation of table}
#'
#' Throughout this explanation, we follow the convention that readers are male.
#'
#' For example,
#' the first row means
#' the first reader (ReaderID=1) correctly find
#' the first lesion (LesionID = 1)
#' in the first image (CaseID = 1)
#' taken by the first modality (ModalityID = 1)
#' with his rating 5 (TP_Rating =5).
#'
#' Similarly,
#' the second row means
#' the first reader (ReaderID=1) correctly find
#' the 4-th lesion (LesionID = 4)
#' in the second image (CaseID = 2)
#' taken by the 2-nd modality (ModalityID = 2)
#' with his rating 4 (TP_Rating = 4).
#'
#'
#'
#' \tabular{ccccc}{
#'   ReaderID \tab   ModalityID   \tab   CaseID \tab   LesionID \tab   TP_Rating.\cr
#'   -------------------\tab-------------------\tab-------------------\tab-------------------\tab------------------\cr
#'   1 \tab 1 \tab 1 \tab  1\tab 5\cr
#'   1 \tab 2 \tab 2  \tab 1\tab 4\cr
#'   1 \tab 3 \tab 4  \tab 1\tab 5\cr
#'   1 \tab 1 \tab 8  \tab 1\tab 3\cr
#'   1 \tab 2 \tab 8  \tab 2\tab 4\cr
#'   1 \tab 3 \tab 9  \tab 1\tab 4\cr
#'   1 \tab 1 \tab 9  \tab 2\tab 3\cr
#'   1 \tab 2 \tab 9  \tab 3\tab 5\cr
#'   1 \tab 3 \tab 11 \tab 1\tab 3\cr
#'   2 \tab 1 \tab 1 \tab  1\tab 4\cr
#'   2 \tab 2 \tab 4  \tab 1\tab 4\cr
#'   2 \tab 3 \tab 5  \tab 1\tab 4\cr
#'   2 \tab 1 \tab 8  \tab 1\tab 1\cr
#'   2 \tab 2 \tab 8  \tab 2\tab 2\cr
#'   2 \tab 3 \tab 8  \tab 3\tab 2\cr
#'   2 \tab 1 \tab 10  \tab 1\tab 3\cr
#'   2 \tab 2 \tab 10 \tab 2\tab 2\cr
#'   2 \tab 3 \tab 11  \tab 1\tab 2\cr
#'
#'   : \tab : \tab :  \tab :\tab :\cr
#'   : \tab : \tab :  \tab :\tab :\cr    }
#'
#'
#'\strong{\emph{-----------------------------------  FP ------------------------------------------}}
#'
#'
#'

#' A sheet named \strong{FP}  consists of four columns  \strong{\emph{ precisely }}
#'  named from the right hand side: \strong{ReaderID,	ModalityID,	CaseID,	FP_Rating}
#'\strong{An Example of a sheet named FP in a file of extension "\code{.xlsx}" file for the Jafroc software}
#'
#'
#'
#'
#'
#'
#'\strong{ Interpretation of table}
#'
#'
#' For example,
#' the first row means that
#' the first reader (ReaderID=1) makes
#'  a false alarm location
#' in the first image (CaseID = 1)
#' taken by the first modality (ModalityID = 1)
#' with his rating 2 (TP_Rating =2).
#'
#' Similarly,
#' the second row means that
#' the first reader (ReaderID=1) makes
#'  a false alarm location
#' in the second image (CaseID = 2)
#' taken by the 2-nd modality (ModalityID = 2)
#' with his rating 1 (TP_Rating = 1).
#'
#'
#' Similarly,
#' the 6-th and 7-th rows mean that
#' the first reader (ReaderID=1) makes
#'  two false alarm location
#' in the second patient (CaseID = 2).
#' The first false alarm  is in the image
#' taken by the 1-st modality (ModalityID = 1)
#' with his rating 1 (TP_Rating = 1).
#' The second false alarm  is in the image
#' taken by the 3-rd modality (ModalityID = 3)
#' with his rating 2 (TP_Rating = 2).
#'
#'
#'
#'
#'
#'
#' \tabular{cccc}{
#'   ReaderID \tab   ModalityID   \tab   CaseID  \tab   FP_Rating.\cr
#' -------------------\tab-------------------\tab-------------------\tab------------------\cr

#'   1 \tab 1 \tab 1 \tab   2\cr
#'   1 \tab 2 \tab 2  \tab  1\cr
#'   1 \tab 3 \tab 3  \tab  1\cr
#'   1 \tab 1 \tab 5  \tab  2\cr
#'   1 \tab 2 \tab 7 \tab   1\cr
#'   1 \tab 3 \tab 7  \tab   2\cr
#'   1 \tab 1 \tab 9  \tab   3\cr
#'   1 \tab 2 \tab 9  \tab   4\cr
#'   1 \tab 3 \tab 10 \tab   1\cr
#'   2 \tab 1 \tab 1 \tab    2\cr
#'   2 \tab 2 \tab 2  \tab   3\cr
#'   2 \tab 3 \tab 3  \tab   4\cr
#'   2 \tab 1 \tab 8  \tab   1\cr
#'   2 \tab 2 \tab 9  \tab  1\cr
#'   2 \tab 3 \tab 11  \tab   1\cr
#'   2 \tab 1 \tab 14  \tab  1\cr
#'   2 \tab 2 \tab 15 \tab   1\cr
#'   2 \tab 3 \tab 21  \tab   2\cr
#'   : \tab :  \tab :\tab :\cr
#'   : \tab :  \tab :\tab :\cr
#'      }
#'
#'
#'
#'
#'\strong{\emph{-----------------------------------  Truth ------------------------------------------}}

#'
#'A sheet named \strong{Truth }  consists of three columns
#' \strong{\emph{ precisely }}  named from the right
#'  hand side:\strong{CaseID,	LesionID,	Weight} .
#'
#'\strong{An Example of a sheet named Truth in a \code{.xlsx} file for the Jafroc software}
#'
#'
#'\strong{ Interpretation of table}
#'
#'For example, the first image (CaseID = 1) contains
#'three lesions each of which is named 1,2,3, namely LesionID = 1,2,3.
#'For example, the second image (CaseID = 2) contains
#'two lesions each of which is named 1,2, namely LesionID = 1,2.
#'For example, the third image (CaseID = 3) contains
#'a sinle lesion named 1, namely LesionID = 1.

#'
#' \tabular{ccc}{
#'   CaseID \tab   LesionID   \tab     Weight\cr
#'   -------------------\tab-------------------\tab------------------\cr

#'   1 \tab 1 \tab    0.3333...\cr
#'   1 \tab 2 \tab    0.3333...\cr
#'   1 \tab 3 \tab    0.3333...\cr
#'   2 \tab 1 \tab    0.5\cr
#'   2 \tab 2 \tab    0.5\cr
#'   3 \tab 1 \tab    1\cr
#'   4 \tab 1 \tab    0.25\cr
#'   4 \tab 2 \tab    0.25\cr
#'   4 \tab 3 \tab    0.25\cr
#'   4 \tab 4 \tab    0.25\cr
#'   5 \tab 1 \tab    0.5\cr
#'   5 \tab 2 \tab    0.5\cr
#'   6 \tab 1 \tab    0.3333...\cr
#'   6 \tab 2 \tab    0.3333...\cr
#'   6 \tab 3 \tab    0.3333...\cr
#'   7 \tab 1 \tab    0.3333...\cr
#'   7 \tab 2 \tab    0.3333...\cr
#'   7 \tab 3 \tab    0.3333...\cr
#'   8 \tab 1 \tab    0.25\cr
#'   8 \tab 2 \tab    0.25\cr
#'   8 \tab 3 \tab    0.25\cr
#'   8 \tab 4 \tab    0.25\cr
#'   :  \tab :\tab :\cr
#'   :  \tab :\tab :\cr
#'   }
#'
#'
#'
#'
#' Note that the weght are used
#' such that each image influences
#' a same effect on the esimates.
#' Without weight, the images including
#' many targets (lesions) will have very strong effect
#' on the estimates.
#' To avoid such bias, Jafroc uses weight.
#' In another context,
#' weight would be used to specify more important lesions in each image.
#'
#'
#' In this package, we do not use the information of weight.
#'Since the theory of the author of this package did not consider such weight.
#' In the future I have to include the notion of weight.
#'Jafroc use the notion fo figure of metric as non parametric manner.
#'So, it seems difficult to include it in the Bayesian model,
#'since generally speaking, Bayesian methodology is parametric.
#'
#'@import readxl
#'
#'@seealso
#'Rjafroc, which is unfortunately not on CRAN, now  2019 Jun 19.
#' Or JAFROC software in the Chakarboty's Web page.
#' Unfortunately, this software is no longer supported.
#'

#'@examples
#'
# \dontrun{
#'## Only run examples in interactive R sessions
#'if (interactive()) {

# ####1#### ####2#### ####3#### ####4#### ####5#### ####6#### ####7#### ####8#### ####9####
#'#========================================================================================
#'#                  Example for convert the Jafroc data
#'#========================================================================================
#'
#'
#' # Work Flow
#'
#'
#' # step 0) Make an .xlsx file "JafrocDatasetExample.xlsx" as example data
#' #          to be passed to the function by  an interactive manner.
#' # step 1) Convert the "JafrocDatasetExample.xlsx" file to an R object
#'
#'
#' # In the following code, when dialog box asks users to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in working directory.
#'
#'
#'
#'
#' # This is important, so I write twice, again.
#'
#'
#' # In the following code, when dialog box asks you to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in Working directory.
#'
#'
#'
#' # In the following code, when dialog box asks you to select a file, then
#' # Select "JafrocDatasetExample.xlsx" in Working directory.
#'
#'
#'
#'
#'
#'
#'#========================================================================================
#'#         step 0)      Make a Jafroc data as an example dataset
#'#========================================================================================
#'
#'# If you can find the xlsx file named JAFROC_data.xlsx
#'# in the director "inst/extdata" of this package,
#'# Then this step 0) is redundant. The author prepares this example for the people who
#'# cannot find the xlsx file in the  "inst/extdata" of this package.
#' # Using an xlsx file ( which is named JAFROC_data.xlsx and
#' # included in the director "inst/extdata" of this package,)
#' # we can reconstruct it  as follows:(If someone can obtain the Excel file
#' # from the path tpfp/inst/extdata/JAFROC_data.xlsx, then the following code
#' # is not required to run, because the same xlsx file is created.
#'
#'
#'
#'
#' Truth <- readxl::read_excel(system.file("extdata",
#'  "JAFROC_data.xlsx",
#'   package="tpfp"),
#'    sheet = "Truth")
#'##### utils::View(Truth)
#'
#' TP <- readxl::read_excel( system.file("extdata",
#'                                       "JAFROC_data.xlsx",
#'                                        package="tpfp"),
#'                            sheet = "TP")
#'#### utils::View(TP)
#'
#' FP <- readxl::read_excel( system.file("extdata",
#'                                       "JAFROC_data.xlsx",
#'                                         package="tpfp"),
#'                           sheet = "FP")
#'#### utils::View(FP)
#'
#'
#'
#'
#'
#'sample <- list(TP=TP,FP=FP,Truth=Truth)
#'openxlsx::write.xlsx(sample,"JafrocDatasetExample.xlsx")
#'
#'  tcltk::tkmessageBox(
#'  message="A file named
#'
#'    JafrocDatasetExample.xlsx
#'
#'
#'  is created in the working directory")
#'
#'
#'# Now, we obtain an excel file named "JafrocDatasetExample.xlsx", which is same as
#'# the JAFROC_data.xlsx.
#'# whose format is available in the Jafroc software developed by Chakraborty.
#'# Note that if you have an excel file
#'# which is formulated correctolly  for our package,
#'# then the above process does not be required.
#'
#'
#'
#'
#'#    (0) From the above, we obtain  "JafrocDatasetExample.xlsx"
#'#    which is the multiple reader and multiple modality dataset
#'#    for Jafroc analysis which is Chakraborty's software Jafroc or the R package Rjafroc
#'#     but  NOT implemented in our package,.
#'
#'
#'
#'
#'#========================================================================================
#'#         step 1)      Convert the Jafroc data obtained in the above
#'#========================================================================================
#'
#'# (1) Using "JafrocDatasetExample.xlsx" as an example excel file,
#'# we run the function to convert the excel file from Jafroc format
#'# to our format:
#'
#'
#'      dataList <- convertFromJafroc(
#'                                   No.of.Modalities =5,
#'                                   No.of.readers    =4,
#'                                   No.of.confidence.levels = 5
#'                                    )
#'
#'
#'
#'# In the variable, there is no xlsx files, since it is selected by interactive manner.
#'# So, please select the xlsx file, i.e.,  "JafrocDatasetExample.xlsx"  obtained
#'# in step 0) or your own Jafroc  .xlsx file.
#'
#'

#'}### Only run examples in interactive R sessions
#'
#'
#           }#\dontrun
#'

#'

#' @export

#' @export convertFromJafroc

convertFromJafroc <- function(
  No.of.Modalities,
  No.of.readers,
  No.of.confidence.levels){


  M <- No.of.Modalities
  Q <- No.of.readers
  C <- No.of.confidence.levels




  ########### PASS ########## START
  message("* Please select a xlsx file to calculate its number of false alarms and true positives for each confidenve level.")
  message("* The lowest confidence level should be 1, not zero.")

  tcltk::tkmessageBox(message="
 * Select a Jafroc file whose extesion is .xlsx to be converted into an R object.

 * The return.value is used to calculate FROC bayesian model in this package by running the following code:

                      fit_Bayesian_FROC(return.value)
                      ")
  path<-tcltk::tclvalue(tcltk::tkgetOpenFile())
  if (!nchar(path)){
    tcltk::tkmessageBox(message="* No file was selected! \n* Exit. \n\n\n* I love you! \n\n\n* You are not alone,... \n  perhaps,...\n  piggy is with you \n  or doggy and doggy are with you,...  ")
    return(message("Suspend a process."))
  }else{
    xlsxfilename <- basename(path)

    tcltk::tkmessageBox(message=paste("* The selected file name:",xlsxfilename,".
* More precisely, its path is the follwing:\n", path, "."))
  }

  # path
  xlsxfilename <- basename(path)
  directoryname  <- dirname(path)
  ########### PASS ########## Fin







  message("\n \n \n \n Wait...")
  fileTP<-xlsx::read.xlsx(path, sheetIndex ="TP")
  message("\n  Wait...")
  fileFP<-xlsx::read.xlsx(path, sheetIndex ="FP")
  message("\n   Wait... \n\n\n")
  fileTruth<-xlsx::read.xlsx(path, sheetIndex ="Truth")


  # head(fileTP )
  # head(fileFP )
  # head(fileTruth)
  # names(fileTP)
  # names(fileFP )
  # names(fileTruth)
  #
  #  C <- 5
  #  M<-5
  #  Q<-4
  # M <-max(max(fileTP$ModalityID),max( fileFP$ModalityID))
  # M <-as.integer (max(  max( fileFP$ModalityID)))
  # Q <-as.integer (max(  max( fileTP$ReaderID  )))

  SRSC <-array(0,list(M,Q,C))
  hhh <-array(0,list(M,Q,C))
  fff <-array(0,list(M,Q,C))
  for (iii in 1:nrow(fileTP)) {
    hhh[  fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ] <- 1+  hhh[  fileTP$ModalityID[iii]  , fileTP$ReaderID[iii]  ,fileTP$TP_Rating[iii]   ]
  }
  for (iii in 1:nrow(fileFP)) {
    fff[  fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ] <- 1+  fff[  fileFP$ModalityID[iii]  , fileFP$ReaderID[iii]  ,fileFP$FP_Rating[iii]   ]
  }


  ######################################################

  m<- rep(1:M, each=C*Q)
  m
  q <-  rep(seq(1,Q,1), M, each=C)
  q
  c <-rep(rep(C:1), M*Q)
  c

  f <-array(0,list(M*Q*C))
  f
  h <-array(0,list(M*Q*C))
  h
  #
  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)
  for (mmm in 1:M) {

    for (qqq in 1:Q) {
      for (ccc in 1:C) {
        h[(mmm-1)*Q*C+(qqq-1)*C+(C+1-ccc)] <-hhh[mmm,qqq,ccc]
        f[(mmm-1)*Q*C+(qqq-1)*C+(C+1-ccc)] <-fff[mmm,qqq,ccc]

      }}}

  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)

  yourdata <- data.frame(ModalityID=m,
                         ReaderID=q,
                         Confidence_lebels=c,
                         True_Positives=h,
                         False_Positives=f)







  # yourdata
  # nrow(yourdata)
  # nrow(yourdata)==M*Q*C
  message("\n--------------------------------------------------  \n\n")
  message(paste("* An excel file named  converted_",xlsxfilename," is made in the directory (",directoryname,"), in which the number of false positives and true positives are calcultated for your data (",xlsxfilename ,"). \n \n ",sep = ""))
  xlsx::write.xlsx(yourdata, file=paste(directoryname,"/converted_",xlsxfilename,sep=""), sheetName="TPsFPs", row.names=F)




  tcltk::tkmessageBox(
    message=paste("
* An excel file named


converted_",xlsxfilename,"

is made in the directory

      ",directoryname,"

  in which the number of false positives and true positives are calcultated for the

                  ",xlsxfilename ,". \n \n ",sep = ""))




  #xlsx::write.xlsx(yourdata, file=paste(directoryname,"/trans... This / is important!! This is it in path !!


  # data.transformed <<- read.xlsx2(paste("transformed",xlsxfilename), 1, stringsAsFactors=FALSE)
  # message("2) A dataframe is made and named 'dataframe.transformed'.   \n")
  # message("--------------------------------------------------  \n")


  NL <- nrow(fileTruth)- nrow(subset(fileTruth ,fileTruth$LesionID ==0) )
  dataList <- list(m=m,q=q,c=c,h=h,f=f, NL=NL, C=C,M=M,Q=Q)
  # assign("dataList", dataList, envir=globalenv())
  message("* I love you 2019. Aug. 1. so,... please please me!  \n\n")

  message("* The retrun value is a list object which is available for model fitting by the fit_Bayesian_FROC().   \n\n")
  message("* If forget to restore the return value, then use the R object  [  .Last.value  ] in which the disired return value is retained.    \n\n")
  message("* For example, execute the R script [   fit <-  fit_Bayesian_FROC(.Last.value  )   ] in which the disired analysis will be done.    \n\n")

  message("--------------------------------------------------  \n")

  return(dataList)
  #
  # dataList.Chakra.Web$m==dataList.transformed$m
  # dataList.Chakra.Web$q==dataList.transformed$q
  # dataList.Chakra.Web$c==dataList.transformed$c
  # dataList.Chakra.Web$h==dataList.transformed$h
  # dataList.Chakra.Web$f==dataList.transformed$f
  # dataList.Chakra.Web$NL==dataList.transformed$NL
  # dataList.Chakra.Web$C==dataList.transformed$C
  # dataList.Chakra.Web$M==dataList.transformed$M
  # dataList.Chakra.Web$Q==dataList.transformed$Q






  #
  # m <- data.transformed$ModalityID
  # q <- data.transformed$ReaderID
  # c <- data.transformed$Confidence_lebels
  # h <- data.transformed$True_Positives
  # f <- data.transformed$False_Positives

  #
  #
  # length(m)
  # length(q)
  # length(c)
  # length(h)
  # length(f)
  # N <-M*Q*C
  #
  #
  # m <-data$m
  # q <-data$q
  # c <-data$c
  # h <-data$h
  # f <-data$f
  # NL<-data$NL
  # C<-data$C
  # M<-data$M
  # Q<-data$Q
  #

}

