/*
====================================================================================================
 Name        : DeTopS.cu
 Author      : Jesse Harder
 Supervisor  : Dr. Christopher Henry, P. Eng.
 Date        : Sept 16, 2018
 Version     : 2.1
 Modified    : Jesse Harder
 Description : This program will:
                    -Optionally discretize input data, from multiple files
                    -Develop set descriptions for each input set
                    -Perform the descriptive intersection power set for the set of input files (CPU or GPU)
                    -Calculate a measure of the closeness of the sets intersected
                    -Output the results of the intersections to a text file
License     : Licensed under the Non-Profit Open Software License version 3.0
 1) Grant of Copyright License. Licensor grants You a worldwide, royalty-free,
 non-exclusive, sublicensable license, for the duration of the copyright, to do the following:

 a) to reproduce the Original Work in copies, either alone or as part of a collective work;

 b) to translate, adapt, alter, transform, modify, or arrange the Original Work, thereby
 creating derivative works ("Derivative Works") based upon the Original Work;

 c) to distribute or communicate copies of the Original Work and Derivative Works
 to the public, with the proviso that copies of Original Work or Derivative Works
 that You distribute or communicate shall be licensed under this Non-Profit Open Software
 License or as provided in section 17(d);

 d) to perform the Original Work publicly; and

 e) to display the Original Work publicly.

 2) Grant of Patent License. Licensor grants You a worldwide, royalty-free,
 non-exclusive, sublicensable license, under patent claims owned or controlled by
  the Licensor that are embodied in the Original Work as furnished by the Licensor,
  for the duration of the patents, to make, use, sell, offer for sale, have made,
   and import the Original Work and Derivative Works.

 3) Grant of Source Code License. The term "Source Code" means the preferred
 form of the Original Work for making modifications to it and all available
 documentation describing how to modify the Original Work. Licensor agrees to
 provide a machine-readable copy of the Source Code of the Original Work along
 with each copy of the Original Work that Licensor distributes. Licensor reserves
 the right to satisfy this obligation by placing a machine-readable copy of the
 Source Code in an information repository reasonably calculated to permit
 inexpensive and convenient access by You for as long as Licensor continues
 to distribute the Original Work.

 4) Exclusions From License Grant. Neither the names of Licensor, nor the names
 of any contributors to the Original Work, nor any of their trademarks or service
 marks, may be used to endorse or promote products derived from this Original Work
 without express prior permission of the Licensor. Except as expressly stated
  herein, nothing in this License grants any license to Licensor's trademarks,
  copyrights, patents, trade secrets or any other intellectual property. No patent
  license is granted to make, use, sell, offer for sale, have made, or import embodiments
  of any patent claims other than the licensed claims defined in Section 2. No license
 is granted to the trademarks of Licensor even if such marks are included in the Original
  Work. Nothing in this License shall be interpreted to prohibit Licensor from licensing
  under terms different from this License any Original Work that Licensor otherwise would
  have a right to license.

 5) External Deployment. The term "External Deployment" means the use, distribution, or
 communication of the Original Work or Derivative Works in any way such that the Original
 Work or Derivative Works may be used by anyone other than You, whether those works are
 distributed or communicated to those persons or made available as an application intended
 for use over a network. As an express condition for the grants of license hereunder,
 You must treat any External Deployment by You of the Original Work or a Derivative
 Work as a distribution under section 1(c).

 6) Attribution Rights. You must retain, in the Source Code of any Derivative Works
 that You create, all copyright, patent, or trademark notices from the Source Code of
 the Original Work, as well as any notices of licensing and any descriptive text
 identified therein as an "Attribution Notice." You must cause the Source Code for
 any Derivative Works that You create to carry a prominent Attribution Notice reasonably
 calculated to inform recipients that You have modified the Original Work.

 7) Warranty of Provenance and Disclaimer of Warranty. The Original Work is provided
 under this License on an "AS IS" BASIS and WITHOUT WARRANTY, either express or implied,
 including, without limitation, the warranties of non-infringement, merchantability or
 fitness for a particular purpose. THE ENTIRE RISK AS TO THE QUALITY OF THE ORIGINAL WORK
 IS WITH YOU. This DISCLAIMER OF WARRANTY constitutes an essential part of this License.
 No license to the Original Work is granted by this License except under this disclaimer.

 8) Limitation of Liability. Under no circumstances and under no legal theory, whether
 in tort (including negligence), contract, or otherwise, shall the Licensor be liable
 to anyone for any direct, indirect, special, incidental, or consequential damages of
 any character arising as a result of this License or the use of the Original Work
 including, without limitation, damages for loss of goodwill, work stoppage, computer
 failure or malfunction, or any and all other commercial damages or losses. This limitation
 of liability shall not apply to the extent applicable law prohibits such limitation.

 9) Acceptance and Termination. If, at any time, You expressly assented to this License,
 that assent indicates your clear and irrevocable acceptance of this License and all of
 its terms and conditions. If You distribute or communicate copies of the Original Work
 or a Derivative Work, You must make a reasonable effort under the circumstances to obtain
 the express assent of recipients to the terms of this License. This License conditions
 your rights to undertake the activities listed in Section 1, including your right to create
 Derivative Works based upon the Original Work, and doing so without honoring these terms and
 conditions is prohibited by copyright law and international treaty. Nothing in this License
 is intended to affect copyright exceptions and limitations (including "fair use" or "fair
 dealing"). This License shall terminate immediately and You may no longer exercise any of
 the rights granted to You by this License upon your failure to honor the conditions in Section 1(c).

 10) Termination for Patent Action. This License shall terminate automatically and You
 may no longer exercise any of the rights granted to You by this License as of the date
 You commence an action, including a cross-claim or counterclaim, against Licensor or any
 licensee alleging that the Original Work infringes a patent. This termination provision
 shall not apply for an action alleging patent infringement by combinations of the Original
  Work with other software or hardware.

 11) Jurisdiction, Venue and Governing Law. Any action or suit relating to this License
 may be brought only in the courts of a jurisdiction wherein the Licensor resides or in
 which Licensor conducts its primary business, and under the laws of that jurisdiction
 excluding its conflict-of-law provisions. The application of the United Nations Convention
 on Contracts for the International Sale of Goods is expressly excluded. Any use of the Original
 Work outside the scope of this License or after its termination shall be subject to the
 requirements and penalties of copyright or patent law in the appropriate jurisdiction.
 This section shall survive the termination of this License.

 12) Attorneys' Fees. In any action to enforce the terms of this License or seeking
 damages relating thereto, the prevailing party shall be entitled to recover its costs and
 expenses, including, without limitation, reasonable attorneys' fees and costs incurred in
 connection with such action, including any appeal of such action. This section shall survive
 the termination of this License.

 13) Miscellaneous. If any provision of this License is held to be unenforceable, such provision
 shall be reformed only to the extent necessary to make it enforceable.

 14) Definition of "You" in This License. "You" throughout this License, whether in upper or
 lower case, means an individual or a legal entity exercising rights under, and complying with
 all of the terms of, this License. For legal entities, "You" includes any entity that controls,
 is controlled by, or is under common control with you. For purposes of this definition, "control"
 means (i) the power, direct or indirect, to cause the direction or management of such entity,
 whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding
 shares, or (iii) beneficial ownership of such entity.

 15) Right to Use. You may use the Original Work in all ways not otherwise restricted or conditioned
  by this License or by law, and Licensor promises not to interfere with or be responsible for such uses by You.

 16) Modification of This License. This License is Copyright © 2005 Lawrence Rosen.
 Permission is granted to copy, distribute, or communicate this License without modification.
 Nothing in this License permits You to modify this License as applied to the Original Work or to
 Derivative Works. However, You may modify the text of this License and copy, distribute or communicate
 your modified version (the "Modified License") and apply it to other original works of authorship
 subject to the following conditions: (i) You may not indicate in any way that your Modified License
 is the "Open Software License" or "OSL" and you may not use those names in the name of your Modified
 License; (ii) You must replace the notice specified in the first paragraph above with the notice
 "Licensed under <insert your license name here>" or with a notice of your own that is not confusingly
 similar to the notice in this License; and (iii) You may not claim that your original works are open
 source software unless your Modified License has been approved by Open Source Initiative (OSI) and
 You comply with its license review and certification process.

 17) Non-Profit Amendment. The name of this amended version of the Open Software License ("OSL 3.0")
 is "Non-Profit Open Software License 3.0". The original OSL 3.0 license has been amended as follows:

 (a) Licensor represents and declares that it is a not-for-profit organization that derives no revenue
 whatsoever from the distribution of the Original Work or Derivative Works thereof, or from support
 or services relating thereto.

 (b) The first sentence of Section 7 ["Warranty of Provenance"] of OSL 3.0 has been stricken. For
 Original Works licensed under this Non-Profit OSL 3.0, LICENSOR OFFERS NO WARRANTIES WHATSOEVER.

 (c) In the first sentence of Section 8 ["Limitation of Liability"] of this Non-Profit OSL 3.0,
 the list of damages for which LIABILITY IS LIMITED now includes "direct" damages.

 (d) The proviso in Section 1(c) of this License now refers to this "Non-Profit Open Software
 License" rather than the "Open Software License". You may distribute or communicate the Original
 Work or Derivative Works thereof under this Non-Profit OSL 3.0 license only if You make the
 representation and declaration in paragraph (a) of this Section 17. Otherwise, You shall distribute or
 communicate the Original Work or Derivative Works thereof only under the OSL 3.0 license and You shall
 publish clear licensing notices so stating. Also by way of clarification, this License does not authorize
 You to distribute or communicate works under this Non-Profit OSL 3.0 if You received them under
 the original OSL 3.0 license.

 (e) Original Works licensed under this license shall reference "Non-Profit OSL 3.0"
 in licensing notices to distinguish them from works licensed under the original OSL 3.0 license.
====================================================================================================
*/
//---------------------------------------------------------------------------------
#include <iostream>   //Standard input output
#include <fstream>    //Read input and write output files
#include <vector>     //Provides access to vector object, for flexibly sized arrays
#include <math.h>     //Provides math functions. pow, log, ceil, floor
#include <stdlib.h>   //Provides size_t datatype
#include <string>     //Provides string object
#include <sstream>    //Provides methods for working with strings
#include <limits>     //Used to derive minFloat
#include <ctime>      //Used for CPU timing code
#include <pthread.h>  //Used for parallel CPU threads
#include <mutex>      //Used for synchronization of parallel cpu code
//---------------------------------------------------------------------------------
static void CheckCudaErrorAux (const char *, unsigned, const char *, cudaError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__,__LINE__, #value, value)

unsigned SETS = 10;    //How many subsets to load in (for testing)
#define STREAMS 500    //How many streams to launch intersectKernels in
typedef unsigned long long bitString;

bool emptySetCheck = false;
//Most negative float value, used as a null in arrays
const float minFloat = (-1) * (std::numeric_limits<float>::max());
//Maximum depth of intersections (max number of sets that can take place in an intersection)
unsigned maxDepth = 0;       
unsigned F_SUBSET_COUNT = 0;  //Number of input sets
unsigned VECTORS_PER_SUBSET;  //Width of each fundamental subset
unsigned VECTOR_SIZE;         //Features per feature vector, defines shared memory tile length
unsigned WIDTH;               //Total width of the output set
unsigned CORES = 1;           //How many cores to run cpu on
unsigned TILE_WIDTH;          //Tile width of intersectKernel

//Global variables used for parallel CPU intersection code
bitString bitPermute;
bitString bitCount;
unsigned cpuDepth = 0;
std::mutex mtx;

using namespace std;

/**
 * This structure is used for passing multiple arguments to the 
 * CPU Intersection function (intersectCPU)
 *     prefixes: A prefix summed set of a row of Pascal's Triangle
 *       pascal: The current pascal number (how many intersections to perform)
 *            a: A pointer to the intersections array (input and output)
 */
typedef struct{
    unsigned pascal;
    float *a;
    float *prefixes;
} intersectArgs;

/******************************************************************************
 * isEmptyKernel
 *
 * This function will determine if a set in the intersections set is the empty set
 * If a thread encounters a non (minFloat) value, it writes a 1 to that intersections
 * position in b, indicating that some non-empty results are in the intersection
 * [in]:
 *         a: The set containing the results of all performed intersections
 *         b: A set containing one value for each set/intersection in a
 *         index: The location in a of the subset to be checked
 *         VECTORS_PER_SUBSET: How many values need to be checked in b
 *         minFloat: The most negative float value, signifies a null or empty result
 *
 * [out]:
 *        b: Modified to have a 1 in the position of every non-empty set
 * [return]:
 *        isEmpty: True if the first value of every vector in the subset is minFloat
 *
 *****************************************************************************/
__global__ void isEmptyKernel(float* a, float *b, bitString index, unsigned VECTORS_PER_SUBSET, 
                                  float  minFloat) {

    //Tracks if any thread in block has found a non empty vector
    __shared__ bool isNotEmpty;

    unsigned id = (blockDim.x * blockIdx.x) + threadIdx.x;
    if (a[VECTORS_PER_SUBSET * index + id] > minFloat && id < VECTORS_PER_SUBSET) {
        isNotEmpty = true;
    }
    __syncthreads();

    //if non-empty vector is found, thread 0 writes to the output array
    if(isNotEmpty == true && threadIdx.x == 0){
        b[index] = 1;
    }
}

/******************************************************************************
 * isEmptySet
 *
 * This function will determine if a set in the intersections set is the empty set
 *
 * [in]:
 *         a: The set containing the results of all performed intersections
 *         index: The location in a of the subset to be checked
 *
 * [return]:
 *         isEmpty: True if the first value of every vector in the subset is minFloat
 *
 *****************************************************************************/
 bool isEmptySet(float *a, bitString index){

    for(unsigned i=0; i < VECTORS_PER_SUBSET; i++){
        if(a[index + i] > minFloat){
            return false;
        }
    }
    return true;
}

/******************************************************************************
 *
 * intersectKernel
 *
 * Each thread intersects an object from one set with all of the objects in another set
 * Objects found in both sets are printed out
 *
 * [in]:
 *         *a: An array containing all sets and vectors
 *         F_SUBSET_SIZE: Number of fundamental subsets in the input
 *         VECTORS_PER_SUBSET: The number of objects per set
 *         VECTOR_SIZE: Number of elements in each vector
 *         indexA: The array index for set A
 *         indexB: The array index for set B
 *         minFloat: Lowest float value, used for "null" data
 *
 * [out]:
 *         A set of all feature vectors that appear in both a[index] 
 *         and a given vector in intersectionSet
 *
 * [return]:
 *         Void
 *
 *******************************************************************************/
__global__ void intersectKernel(float *a, unsigned F_SUBSET_COUNT, unsigned VECTORS_PER_SUBSET, 
                                    unsigned VECTOR_SIZE, bitString indexA, bitString indexB, 
                                    bitString indexC, float minFloat, unsigned WIDTH){

    //Shared memory to store the two shared memory matrices, A B
    extern __shared__ float tiles[];
    unsigned TILE_WIDTH = blockDim.x;
    float *tileA = &tiles[0];
    float *tileB = &tiles[(TILE_WIDTH * (VECTOR_SIZE + 1))];

    //Boolean  that tracks if this thread's vector has matched with any vector in the other set
    bool inIntersect = false;
    unsigned tx = threadIdx.x;
    unsigned width = WIDTH;

    //Overall id of current thread
    unsigned id = (blockDim.x * blockIdx.x) + threadIdx.x;

    //Load this thread's vector of a into shared memory
    for(unsigned i = 0; i < VECTOR_SIZE + 1; ++i){
        if(id < VECTORS_PER_SUBSET){
            tileA[i*TILE_WIDTH + tx] = a[indexA * VECTORS_PER_SUBSET + id + width * i];
        }else{
            //Set element to minimum value (value to be ignored), if the thread is out of bounds
            tileA[i*TILE_WIDTH + tx] = minFloat;
        }
    }

    for(unsigned q = 0; q < gridDim.x; ++q){
        //Load this thread's corresponding vector in the qth tile of b into shared memory
        for(unsigned i = 0; i < VECTOR_SIZE + 1; ++i){
            if((q * TILE_WIDTH) + tx < VECTORS_PER_SUBSET){
                tileB[i*TILE_WIDTH + tx] = 
                    a[indexB * VECTORS_PER_SUBSET + tx + (TILE_WIDTH * q) + (width * i)];
            }else{
                //Set element to minimum value (value to be ignored), if the thread is out of bounds
                tileB[i*TILE_WIDTH + tx] = minFloat;
            }
        }

        __syncthreads();

        if(tileA[tx] > minFloat && inIntersect == false){

            for(unsigned i=0; i < TILE_WIDTH; ++i){
                //Two vectors are equal until non-equal elements in the vectors are encountered
                bool match = true;

                for(unsigned j=0; j < VECTOR_SIZE; ++j){
                ////! Replace this if statement with a function to suit your implementation!////
                    if(tileA[j*TILE_WIDTH + tx] != tileB[j*TILE_WIDTH + i]){
                        match = false;
                        break;
                    }
                }

                if(match == true){
                    inIntersect = true;
                    tileA[(VECTOR_SIZE)*TILE_WIDTH + tx] += tileB[(VECTOR_SIZE)*TILE_WIDTH + i];
                    break;
                }
            }

        }
        __syncthreads();
    }

    //If this vector has not matched with any vector in the other set, set it to "null"
    if(inIntersect == false){
        for(unsigned i = 0; i < VECTOR_SIZE + 1; ++i){
            tileA[i*TILE_WIDTH + tx] = minFloat;
        }
    }

    __syncthreads();

    //Write tileA to it's space in a (the intersection power set)
    if(id < VECTORS_PER_SUBSET){
        for(unsigned i = 0; i < VECTOR_SIZE + 1; ++i){
            a[indexC * VECTORS_PER_SUBSET + id + width * i] = tileA[i*TILE_WIDTH + tx];
        }
    }
}

/******************************************************************************
 * getTrailingZeros
 *
 * Calculates how many trailing 0s exists in the binary form of a number
 *         This function is to be called as a part of function: next_perm
 * [in]:
 *         w: Some integer to be checked
 * [out]:
 *         None
 * [return]:
 *         x: The count of the trailing zeros of w
 *
 *******************************************************************************/
bitString getTrailingZeros(bitString w){
    bitString x = 0;
    while(w % 2 == 0 && w > 0){
        w = w >> 1;
        x++;
    }
    return x;
}

/******************************************************************************
 * next_perm
 * Gives the next permutation for a bit sequence containing the same number of bits as v
 * [in]: v: previous permutation
 * [out]: none
 * [return]: Next permutation for a bit sequence containing the same number of bits as v
 * [comments]: Used in conjunction with element_0. Function obtained from:
 *               http://alexbowe.com/popcount-permutations/
 *               http://graphics.stanford.edu/~seander/bithacks.html
 *
 *******************************************************************************/
bitString next_perm(bitString v){
    //v is the current permutation of bits
    bitString w; //next permutation of bits

    bitString t = v | (v - 1); // t gets v's least significant 0 bits set to 1
    //Next set to 1 the most significant bit to change,
    //set to 0 the least significant ones, and add the necessary 1 bits.
    w = (t + 1) | (((~t & -~t) - 1) >> (getTrailingZeros(v) + 1));

    return w;
}

/******************************************************************************
 * getBitPatternIndex
 *
 * This function returns a number corresponding to which bit pattern the input is at a given level
 * For example, 0011 is the first pattern of 2 bits, 0101 the second , 0110 the third...
 *
 *
 * [in]:
 *         depth: the number of on bits in the bit pattern
 *         bitPattern: a string of bits with depth 1's
 *
 * [out]:
 *        None
 *
 * [return]:
 *         i: the index of which combination of #depth bits was provided
 *
 *******************************************************************************/
bitString getBitPatternIndex(unsigned depth, bitString bitPattern){
    unsigned i = 0; //Stores the current index of the bit pattern 
    bitString compareBits = (1 << depth) -1; //Get first bit pattern with #depth one's
    while( true ){
        if(bitPattern == compareBits)
            return i;
        i++;
        compareBits = next_perm(compareBits);
    }
}

/******************************************************************************
 * intersectCPU
 *
 * This function will intersect two sets together using the CPU.
 * Each thread of this function will handle an intersection.
 * When the intersection is completed, the thread will check if there are more intersections to do
 * if not, exit function
 *
 * [in]:
 *         args: An object containing:
 *            a: The intersections set, where data is read from, and written to
 *       pascal: The Pascal number stating how many intersections need to be performed at this level
 *     prefixes: A prefix sum of the pascal numbers, used to find indexes
 * [out]:
 *        This function will insert the result of the intersection to the intersection array
 *        at set index singleBit+myBits
 *
 * [return]:
 *         Void
 *******************************************************************************/
void *intersectCPU(void* args){
    bitString curBits;     //Bit index of the result of the intersection
    bitString myIndex;     //Index of Set A in intersections array
    bitString singleIndex; //Index of Set B in intersections array
    bitString outIndex;    //Index of output Set C in intersections array

    intersectArgs *arg = (intersectArgs*)args; //Holds data structure defined above
    std::unique_lock<std::mutex> critZone (mtx, std::defer_lock); //Declare lock for parallelization

    //Loop runs until there are no more intersections to be performed at this level
    while(true){
    ///////////////only one thread may perform this section at a time////////////////////
        critZone.lock();

        //If all intersections have been performed, exit function
        if(bitCount >= arg->pascal){
            free(arg);
            critZone.unlock();
            return 0;
        }

        //Get the next intersection to be performed
        if(bitCount > 0){
            bitPermute = next_perm(bitPermute);
        }
        curBits = bitPermute;
        outIndex = arg->prefixes[ 1 + cpuDepth ] + bitCount;
        singleIndex = 1+getBitPatternIndex(1, curBits & -curBits);
        myIndex = arg->prefixes[cpuDepth] + 
                      getBitPatternIndex(cpuDepth, curBits - (curBits & -curBits));
        bitCount++;
        critZone.unlock();
    ///////////////end single thread critical section //////////////////////////////////////

        //Determine which sets are being intersected
        outIndex *= VECTORS_PER_SUBSET;
        myIndex *= VECTORS_PER_SUBSET;
        singleIndex *= VECTORS_PER_SUBSET;

        //Tracks how many equal vectors have been found, 
        //This is used as an index for writing matched vectors to the Power Set array
        unsigned count=0;

        //If the set to be intersected is the empty set, skip to next intersection
        if(emptySetCheck == true){
            if(isEmptySet(arg->a, myIndex) == true){
                continue;
            }
        }

        //for each vector in set a
        for(unsigned k = 0; k < VECTORS_PER_SUBSET; ++k){
            //Compare to each vector in set b
            for(unsigned i = 0; i < VECTORS_PER_SUBSET; ++i){
                //Match is true until a value that does not match between the two vectors is found
                bool match = true;
                //Compare all of the elements in the two vectors
                for(unsigned j = 0; j< VECTOR_SIZE; ++j){
                    //If two elements don't match, or the value is minFloat the match is false
                    if(arg->a[singleIndex + k + (WIDTH * j)] != arg->a[myIndex + i + (WIDTH *j)] 
                           || arg->a[singleIndex + k + (WIDTH * j)] <= minFloat){
                        match = false;
                        break;
                    }
                }
                //If no non-matching elements are found, 
                // write the matching vector to the Intersection Power Set array
                if(match == true){
                    for(unsigned m = 0; m < VECTOR_SIZE + 1; ++m){
                        arg->a[outIndex  + k + (WIDTH * m)] =
                            arg->a[singleIndex + k + (WIDTH*m)];

                        //Add the feature counts of the two matching vectors together
                        if(m == VECTOR_SIZE)
                            arg->a[outIndex + k + (WIDTH * m)] =
                                arg->a[singleIndex + k + (WIDTH * m)] +
                                arg->a[myIndex + i + (WIDTH * m)];
                    }
                    count++;
                    break;
                }
            }
        }
    }
}

/******************************************************************************
 * discretize
 *
 * Discretizes an array of floats (Values 1 to (specified number of values) )
 *
 * [in]:
 *         *data: pointer to the array of floats to be discretized
 *         size: the size of the data array
 *         num_bins: the number of discrete values to divide the data into,
 *                   determined by user input
 *
 * [out]:
 *         *data: Discretized array
 *
 * [return]:
 *         void
 *
 *******************************************************************************/
void discretize(float *data, unsigned size, unsigned num_bins) {

    float min = data[0];    //Records the maximum value of the input data
    float max = data[0];    //Records the minimum value of the input data
    float *bounds = new float[num_bins + 1];    //Calculates the boundary values of the array

    //Get max and min of data set
    for (unsigned i = 0; i < size; ++i) {
        if (data[i] < min)
            min = data[i];
        if (data[i] > max) {
            max = data[i];
        }
    }
    
    //If min < 0, then shift values to the right, so all are positive
    if (min < 0) {
        for (unsigned i = 0; i < size; ++i) {
            data[i] += min * (-1);
        }
    }

    //If max != 1, divide all values in range 0-1
    if (max != 1) {
        for (unsigned i = 0; i < size; ++i) {
            data[i] /= max;
        }
    }

    //Generate bounds for partition, based on int parts
    float partSize = 1.0 / num_bins;
    for (unsigned i = 0; i < num_bins + 1; ++i) {
        bounds[i] = i * partSize;
    }

    //Set each data value into it's value range
    for (unsigned i = 0; i < size; ++i) {
        if (data[i] == bounds[num_bins]) {
            data[i] = num_bins;
            continue;
        }
        for (unsigned j = 0; j < num_bins; ++j) {
            if (data[i] >= bounds[j] && data[i] < bounds[j + 1]) {
                data[i] = j + 1;
            }
        }
    }
}

/******************************************************************************
 * initNegative
 *
 * Initializes the values in a float array to the lowest float value
 * These values serve as a check for `null` values in the set descriptions
 * The values in the last row are set to 1`s, the initial value of the object's 
 * frequency in the fundamental subset
 *
 * [in]:
 *         *data: The set description array, to be initialized
 *         size: The number of elements in the array, not including vector counts
 * [out]:
 *         *data: All values initialized to the most nagative float value
 *
 * [return]:
 *         Void
 *
*******************************************************************************/
void initNegative(float *data, unsigned size) {
    
    for (unsigned i = 0; i < size; ++i) {
        data[i] = minFloat;
    }
}

/******************************************************************************
 * createSetDescription
 *
 * Takes in a set of feature vectors, then finds all unique vectors in the set
 *
 *     [in]:
 *         *v: pointer to a set of feature vectors
 *         *w: pointer to output for set of unique descriptions
 *
 *     [out]:
 *         *w: vector of feature vectors to be filled with unique descriptions
 *
 *     [return]:
 *         void
 *
 *******************************************************************************/
void createSetDescription(float *v, float *w){

    for(int fa = 0; fa < F_SUBSET_COUNT; ++fa){
        unsigned setIndex = (fa + 1) * VECTORS_PER_SUBSET;
        int uniqueCount = 0;//Running total of the number of unique objects encountered
        
        //For each vector in A
        for(unsigned i = 0; i < VECTORS_PER_SUBSET; ++i){
            //Tracks if the current vector of v is unique (has not matched with any vectors of w)
            bool isUnique = true;
            //For each vector in D(A)
            for(unsigned j = 0; j < uniqueCount; ++j){
                //Tracks if the current vector of v matches with the current vector of w
                bool unique = false;
                //For each element in current vector
                for(unsigned k = 0; k < VECTOR_SIZE; k++){
                    //If any two elements don't match, then the two vectors don't match
                    if(v[(fa * VECTORS_PER_SUBSET) + (k * VECTORS_PER_SUBSET * F_SUBSET_COUNT) +i]
                          != w[setIndex + (k * WIDTH ) + j]){
                        unique = true;
                        break;
                    }
                }

                if(unique == false){
                    isUnique = false;
                    //If vector is not unique, increment the conut of the vector it matched with
                    w[setIndex + (VECTOR_SIZE * WIDTH ) + j]++;
                    break;
                }
            }
    
            if(isUnique){
                //If the vector is unique, insert it into intersection set
                for(int j = 0; j < VECTOR_SIZE; ++j){
                    w[setIndex + (j * WIDTH) + uniqueCount] = 
                       v[(fa * VECTORS_PER_SUBSET) + (j * VECTORS_PER_SUBSET * F_SUBSET_COUNT) +i];
                }
                w[setIndex + (VECTOR_SIZE * WIDTH) + uniqueCount] = 1;
                uniqueCount++;
            }
        }
    }
}

/******************************************************************************
 * calculateMeasure
 *
 * Calculates the final measure of closeness of sets
 *
 *     [in]:
 *         emptySetSize: the number of sets to be calculated
 *         *prefixPascal: an array of prefix summed Pascal numbers
 *         *intersections: the array of data to be operated upon
 *         pascalTotal: a weighted sum of pascal numbers, used for calculation
 *         verbose_info: a boolean specifying whether to print detailed info or not
 *         measure_within_set: a boolean specifying whether intersections of sets that are all 
 *                             within one family should be included or not
 *
 *     [out]:
 *         none
 *
 *     [return]:
 *         totalMeasure: the final result of the measure calculation
 *
 *******************************************************************************/
float calculateMeasure(unsigned emptySetSize, float* prefixPascal, float* intersections, 
                          float pascalTotal, bool verbose_info, bool measure_within_set){
    float totalMeasure = 0; //Stores total measure
    float weightedOut = 0;  //Total measure lost to intersections we don't want to include
    //how many sets are in each intersection
    unsigned depth = 0;
    unsigned checkPoint = 0;
	
    if(measure_within_set == true){
        printf("Include single family intersections in measure\n");
    }else{
        checkPoint = pow(2, F_SUBSET_COUNT/2);
        printf("Exclude single family intersections from measure: CheckPoint = %i\n", checkPoint);
    }

    for(bitString i = 1; i < emptySetSize; ++i){
        //Total count of vectors in this intersection
        float total = 0;
        bitString bitPattern;
        if(i == prefixPascal[depth+1]){
            depth++;
            bitPattern = (1 << depth) -1;
        }else{
            bitPattern = next_perm(bitPattern);
        }

        //Total all of the counts of vectors in this set
        for(unsigned j = 0; j < VECTORS_PER_SUBSET; ++j){
            if(intersections[(VECTORS_PER_SUBSET * i) + j + (WIDTH * VECTOR_SIZE)] > minFloat){
                total += intersections[(VECTORS_PER_SUBSET * i) + j + WIDTH * VECTOR_SIZE];
            }
        }
        //Calculate the weighted value of this set's count, and add it to the final measure
        float weightedValue = ((float)depth / pascalTotal) * (total / VECTORS_PER_SUBSET);
      
        //Ayotu
        if(measure_within_set == false && (bitPattern<checkPoint || (bitPattern%checkPoint == 0))){
            weightedOut += weightedValue;
            if(verbose_info == true) 
                printf("(Excluded from measure)");
        }else{
            totalMeasure += weightedValue;
        }
        //Print detailed information on each intersection performed
        if(verbose_info == true){
            std::cout << "Bit Pattern :" << bitPattern << ", ";
            printf("Index: %i, #Sets: %i  Count: %f / %i, Weighted: %f\n",
                       i, depth, total, depth * VECTORS_PER_SUBSET, weightedValue);
        }
    }

    //Remove the weight of single family intersections
    totalMeasure /= (1 - weightedOut);
	
    //Account for rounding
    if(totalMeasure > 1) totalMeasure = 1;

    //totalMeasure = (totalMeasure - ((float)F_SUBSET_COUNT / pascalTotal)) / 
    //                   (1 - ((float)F_SUBSET_COUNT / pascalTotal) );
    return totalMeasure;
}

/******************************************************************************
 * writeToFile
 *
 * Writes the results of the intersections to a text file
 *
 * [in]:
 *         *originalValue: an array of the original values read in from the input files
 *         *intersections: the array of data to be operated upon
 *
 *     [out]:
 *         result.txt: A text file containing all of the results from the intersections
 *
 *     [return]:
 *         void
 *
 *     [notes]:
 *         Results written map to the least significant bit (set) that 
 *         was involved in the intersection
 *         ie: Set 1 2 and 3 intersect, output will be vectors from Set 1
 *         Counts of each vector are printed in parentheses at the end of each vector
 *
 *******************************************************************************/
void writeToFile(float *intersections, float *originalValues){

    ofstream out("result.txt"); //Write output of final intersection to file
    unsigned curPascal = F_SUBSET_COUNT;//Tracks many sets exist in each level of depth(Inital: 1 set at depth 0)   
    unsigned intersectIndex = 1; //An overall count of which intersection is being written

    for(unsigned k = 1; k <= maxDepth; k++){
        for(bitString j = 0; j < curPascal; ++j){
            //A bit pattern showing which sets were invloved in the intersectIndex'th intersection
            bitString bitPattern;

            if(j == 0){
                //Get first pattern of k bits
                bitPattern = (1 << k) -1;
            }else{
                //Get next pattern of k bits
                bitPattern = next_perm(bitPattern);
            }
			//Get the least significant bit from the bitPattern
            bitString setIndex = __builtin_ffs(bitPattern) - 1;
            //Write which set this is, and what bit pattern it maps to
            out << "Set: " << intersectIndex << " Bit pattern: " << bitPattern << 
			    " Least bit: " << setIndex << endl;
            
            for(unsigned i = 0; i < VECTORS_PER_SUBSET * (VECTOR_SIZE + 1); ++i){
                if(intersections[(intersectIndex * VECTORS_PER_SUBSET) + WIDTH * 
                    (i % (VECTOR_SIZE + 1)) + i / (VECTOR_SIZE + 1) ] != minFloat){
                    //If this is the last element, print the vector count from intersections
                    if(i % (VECTOR_SIZE + 1) == (VECTOR_SIZE)){
                        out << "(" << intersections[(intersectIndex * VECTORS_PER_SUBSET) + 
                            WIDTH * (VECTOR_SIZE) + i / (VECTOR_SIZE + 1) ] << ")" << endl;
                    }else{
                        //Write the values, mapped to the original input values
                        out << originalValues[(setIndex * VECTORS_PER_SUBSET) +  
                            (VECTORS_PER_SUBSET * F_SUBSET_COUNT) * (i % (VECTOR_SIZE + 1)) 
                            + i / (VECTOR_SIZE + 1) ] << " ";
                    }
                }
            }
            intersectIndex++;
        }
        //Get the number of sets at the next level of depth
        curPascal = curPascal * ((F_SUBSET_COUNT - k)/ (k + 1.0));
    }
}

/******************************************************************************
 * writeToFile_D
 *
 * Writes the discretized results of intersections to a text file
 *
 * [in]:
 *         *originalValue: an array of the original values read in from the input files
 *         size: The number of sets to be written
 *
 * [out]:
 *         result.txt: A text file containing all of the results from the intersections(discretized)
 *
 * [return]:
 *         void
 *
 * [notes]: The count of how many times a vector appeared in an intersection is written in
 *          parentheses at the end of the vector
 *
 *******************************************************************************/
void writeToFile_D(float *intersections, unsigned size){

    ofstream out("result.txt"); //Write output of final intersection to file

    for(unsigned k = 0; k < size; k++){
        out << "Set " << k << endl;
        for(unsigned i = 0; i < VECTORS_PER_SUBSET * (VECTOR_SIZE + 1); ++i){
            if(intersections[(k * VECTORS_PER_SUBSET) + WIDTH * (i % (VECTOR_SIZE + 1)) + 
                   i / (VECTOR_SIZE + 1)] != minFloat){
                if(i % (VECTOR_SIZE + 1)== (VECTOR_SIZE)){
                    out << "(" << intersections[(k * VECTORS_PER_SUBSET) + WIDTH * 
                        (VECTOR_SIZE) + i / (VECTOR_SIZE + 1) ] << ")" << endl;
                }else{
                    out << intersections[(k * VECTORS_PER_SUBSET) +  WIDTH * 
                        (i % (VECTOR_SIZE + 1)) + i / (VECTOR_SIZE + 1) ] << " ";
                }
            }
        }
    }
}

/******************************************************************************
 * printHelp
 *
 * Prints out all available command parameters, and a short description of each
 *
 * [in]:
 *         None
 * [out]:
 *         A list and description of all command parameters
 *
 * [return]:
 *         void
 *
 *******************************************************************************/
void printHelp(){
    printf("\nCommand Parameters:\n");
    printf("\t-b [int > 0]: Specifies how many bins to discretize into, if discretizing\n");
    printf("\t-c: Instructs program to run all intersections on the CPU\n");
    printf("\t-cg: Instructs program to run all intersections on GPU, then again on CPU (used for testing)\n");
    printf("\t-cores [int >0]: Specifies how many cores to run parallel CPU code on\n");
    printf("\t-d: Instructs program to discretize the input data (Default: 3 bins)\n");
    printf("\t-f [file0 file1 ... fileN]: Manually list all input files to use !!Must be last parameter!!\n");
    printf("\t-fd [int > 0] [file0] [file1]: Specifies to read in X files from exactly 2 file locations, file0 and file1\n");
    printf("\t-gpu [int >= 0]: Specify which device to run GPU segments on. Requires a valid device id\n");
    printf("\t-help: Prints out available command line parameters, then exits program\n");
    printf("\t-in: Instructs program to include intersections within a single family in the final measure calculation (excluded by default)\n");
    printf("\t-md [int > 0]: Specifies maximum depth of intersections to perform. (Default = number of input sets)\n");
    printf("\t-mt: Instructs code to perform check to see if sets to be intersected are empty or not\n");
    printf("\t-o [int > 0]: MANDATORY!! Specifies the number of features per feature vector\n");
    printf("\t-t: Instructs program to time the code, and print results of the timing\n");
    printf("\t-v: Instructs program to print verbose information while running\n");
}

/******************************************************************************
 * cpuIntersections
 *
 * Sets up the algorithm to perform all finite intersections on the CPU
 *
 * [in]:
 *         intersections: A pointer to an array holding all fundamental subsets,
 *             and space for the output of the intersections
 *
 *         prefixPascal: A pointer to an array of prefix summed Pascal Numbers used
 *             to determine how many intersections to perform
 *
 *         time_code: Boolean determining whether to time the code or not
 * [out]:
 *         intersections: The results of all intersections saved to the array
 *
 * [return]:
 *         void
 *
 *******************************************************************************/
void cpuIntersections(float* intersections, float* prefixPascal, bool time_code){
    pthread_t* threads = new pthread_t[CORES];
    void *status;

    printf("Performing CPU (%i Cores) Power Set on %i Fundamental Subsets\n",CORES, F_SUBSET_COUNT);
    //Time and perform the intersections on the CPU   
    clock_t st = clock();
    
    float curPascal = F_SUBSET_COUNT;
    for(unsigned i = 1; i < maxDepth; ++i){
        cpuDepth++;
        //Get next Pascal number
        curPascal = curPascal * ((F_SUBSET_COUNT - i) / (i + 1.0));
        bitPermute = (1 << i + 1) - 1;
        bitCount = 0;
        
        for(unsigned j = 0; j < CORES; ++j){
            //Prepare the parameters for the intersect CPU thread function
            intersectArgs* args = (intersectArgs*)malloc(sizeof(args));
            args->a = intersections;
            args->pascal = curPascal;
            args->prefixes = prefixPascal;
            //Call intersect function to perform an intersection on 
            // the sets #leastBit and #(bitPattern-leastBit)
            pthread_create(&threads[j], NULL, intersectCPU, args);
        }
        for(unsigned j = 0; j < CORES; ++j){
            pthread_join(threads[j], &status);
        }
    }

    //End timing and print out runtime
    if(time_code == true){
        clock_t ed = clock();
        clock_t stm = clock();
        clock_t edm = clock();
        cout << "Elapsed time on host: "<<(((float)((ed - st) / CORES) + (edm - stm) ) / 
            (float)CLOCKS_PER_SEC) * 1000    << " ms" << std::endl;
    }
}

/******************************************************************************
 * gpuIntersections
 *
 * Sets up and launches the kernels that perform intersections on the GPU
 *
 * [in]:
 *         intersections: A pointer to an array holding all fundamental subsets,
 *             and space for the output of the intersections
 *
 *         prefixPascal: A pointer to an array of prefix summed Pascal Numbers used
 *             to determine how many intersections to perform
 *
 *         time_code: Boolean determining whether to time the code or not
 *
 *         emptySetSize: Determines how many sets will result from the finite intersections
 *
 * [out]:
 *         intersections: The results of all intersections saved to the array
 *
 * [return]:
 *         void
 *
 *******************************************************************************/
void gpuIntersections(float* intersections, float* prefixPascal, bool time_code, 
                          unsigned emptySetSize){
    //A set to track which sets are empty/non-empty,
    float *emptySets = new float[emptySetSize];
    float *deviceEmptySets;
    for(bitString i = 0; i < emptySetSize; ++i){
        emptySets[i] = minFloat;
    }

    if(emptySetCheck == true){
        CUDA_CHECK_RETURN(cudaMalloc((void**)&deviceEmptySets, emptySetSize*sizeof(float)));
        CUDA_CHECK_RETURN(cudaMemcpy(deviceEmptySets, emptySets, emptySetSize*sizeof(float),
        cudaMemcpyHostToDevice));
    }

    printf("Performing GPU Power Set on %i Fundamental Subsets\n", F_SUBSET_COUNT);

    //Declare array to track which sets in intersections set are not empty sets
    //Set up timer code
    cudaEvent_t start, stop;
    float elapsedTime;
    cudaStream_t* streams = new cudaStream_t[STREAMS];
    if(time_code == true){
        CUDA_CHECK_RETURN(cudaEventCreate(&start));
        CUDA_CHECK_RETURN(cudaEventCreate(&stop));
        CUDA_CHECK_RETURN(cudaEventRecord(start, 0));
    }

    float curPascal = F_SUBSET_COUNT;
    for(unsigned j = 0; j < STREAMS; ++j){
        CUDA_CHECK_RETURN(cudaStreamCreate(&streams[j])); //Create streams
    }

    for(unsigned i = 1; i < maxDepth; ++i){
        //Use pascal numbers to determine how many intersections are performed at this level
        curPascal = curPascal * ((F_SUBSET_COUNT - i)/ (i + 1.0));
        bitString bitPattern = (1 << i + 1) -1; //Get the first combination of i bits

        if(emptySetCheck == true){
            //For every intersection of i sets
            CUDA_CHECK_RETURN(cudaMemcpy(emptySets, deviceEmptySets, emptySetSize*
                                 sizeof(float), cudaMemcpyDeviceToHost));
            CUDA_CHECK_RETURN(cudaGetLastError());
        }
        for(bitString j = 0; j < curPascal; ++j){
            bitString leastBit = bitPattern & -bitPattern;
            bitString setAIndex = prefixPascal[i] + 
                getBitPatternIndex(i, bitPattern - leastBit);
            //Check if the sets to be intersected are empty
            if(emptySetCheck == false || emptySets[setAIndex] > minFloat || i == 1){
                unsigned myStream = j % STREAMS;
                //Launch intersection into stream j
                intersectKernel <<< 
                                   1 + (VECTORS_PER_SUBSET / TILE_WIDTH), TILE_WIDTH, 
                                   TILE_WIDTH * (VECTOR_SIZE + 1) * sizeof(float) * 2, 
                                   streams[myStream] 
                                >>>
                                (
                                    intersections, F_SUBSET_COUNT, VECTORS_PER_SUBSET, 
                                    VECTOR_SIZE, 1 + getBitPatternIndex(1, leastBit), setAIndex, 
                                    prefixPascal[i+1] + j, minFloat, WIDTH
                                );
                CUDA_CHECK_RETURN(cudaGetLastError());

                if(emptySetCheck == true){
                    //Determine if the intersection performed yielded the empty set
                    isEmptyKernel <<< 
                                     (unsigned)ceil((float)VECTORS_PER_SUBSET / 
                                         min(VECTORS_PER_SUBSET, 512)), 
                                     min(VECTORS_PER_SUBSET, 512), 0, streams[myStream] 
                                  >>>
                                  (
                                     intersections, deviceEmptySets, prefixPascal[i+1] + j, 
                                     VECTORS_PER_SUBSET, minFloat
                                  );
                }
            }
            //Get the next combination of bits
            bitPattern = next_perm(bitPattern);
        }
        cudaDeviceSynchronize();
    }

    //Destroy all streams
    for(unsigned j = 0; j < STREAMS; ++j){
        CUDA_CHECK_RETURN(cudaStreamDestroy(streams[j]));
    }
    cudaDeviceSynchronize();

    if(time_code == true){
        CUDA_CHECK_RETURN(cudaThreadSynchronize());// Wait for the GPU launched work to complete

        CUDA_CHECK_RETURN(cudaEventRecord(stop, 0));
        CUDA_CHECK_RETURN(cudaEventSynchronize(stop));
        CUDA_CHECK_RETURN(cudaEventElapsedTime(&elapsedTime, start, stop));

        CUDA_CHECK_RETURN(cudaEventDestroy(start));
        CUDA_CHECK_RETURN(cudaEventDestroy(stop));
        cout << "Elapsed kernel time: " << elapsedTime << " ms" << std::endl;
    }
    CUDA_CHECK_RETURN(cudaGetLastError());
    cudaFree(deviceEmptySets);
}

/******************************************************************************
 * DeTopS main
 *
 * F_SUBSET_COUNT: The specified number of fundamental subsets the data is to be divided into
 * VECTOR_SIZE:    The specified number of elements each feature vector contains
 * VECTORS_PER_SUBSET: The specified number of feature vectors in a fundamental subset
 *
 * totalSize: The total number of elements in the input data
 * fundamentalSubset: A float array that holds the input data
 * intersections: The descriptions of the fundamental subsets, and all descriptive intersections 
 *                between them. In the case a set description's size < the set's size, the extra 
 *                space for that subset is filled with minimum float values
 *
 * [Command Line parameters]:
 *         discretize_input:
 *             Determines whether the input data will be discretized
 *             Requires -b if used
 *             Default: False
 *             Set true by command param -d
 *
 *         num_bins:
 *             Determines how many discrete values are to be used when discretizing
 *             Default: 3
 *             Set by command param -b [int>0]
 *
 *         inputFile:
 *             Determines which files the data is to be read from
 *             !Must be the last parameter entered, followed only by the input files!
 *             Use either this or -fd
 *             Default: None
 *             Set by command param -f [file1 file2 ... fileN]
 *
 *        useCPU:
 *            Determine whether the intersections will be performed on CPU or GPU
 *            Default: False (Run intersections on GPU)
 *            Set true by command param
 *                -c (Sets useGPU false) or
 *                -cg (Sets useCPU and useGPU true)
 *
 *        emptySetCheck:
 *            Determine whether the GPU will check if a set is empty before performing intersection
 *            Setting true may speed up or slow down results, 
 *                 depending on the data, but the output will be the same
 *            Default: False
 *            Set True by command param -mt
 *
 *        time_code:
 *            Determines whether the program will be timed while running or not
 *            Default: False
 *            Set true by command param -t
 *
 *        VECTOR_SIZE:
 *            Determines the number of elements in each feature vector
 *            !Mandatory!
 *            Must be a whole number > 0
 *            Set by command param -o [int>0]
 *
 *        CORES:
 *            Determines how many cores the cpu will run on
 *            Default: 1
 *            Set by command param -cores [int>0]
 *
 *        verbose_info:
 *            Determines if detailed output will be printed
 *            This includes:
 *                Measure for each intersection
 *                Device information
 *                Number of unique feature vectors in each fundamental subset
 *            Default: False
 *            Set true by command param -v
 *        
 *        measure_within_set:
 *            Specify weather measure should be calculated for intersections of sets from one family
 *            Default: False (do not include these in the measure)
 *            Set true by command param -in
 *              
 *        device:
 *            Determines which device the GPU code will run on
 *            Takes in the integer id of a CUDA device
 *            Default: 0
 *            Set by command param -gpu [int>0]
 *
 *        set1, set2:
 *            Determines where to read files from
 *            Takes in an integer followed by two strings
 *            Integer is how many sets to read
 *            String 1 is the file path and name of first set, minus the number
 *            String 2 is the file path and name of second set, minus the number
 *            Use either this or -f
 *            Set by command param -fd [int>0] [string] [string]
 *
 *
 * Input Assumptions:
 *    Each input file will represent 1 Fundamental Subset
 *    Each input file will have the same dimensions 
 *         (Vectors per subset, features per vector, total size)
 *    User will provide the number of elements per feature vector at run time
 *
 *******************************************************************************/
int main(int argc, const char ** argv) {

    bool gpuDevice = false; //Tracks whether a GPU device is available or not
    bool useCPU = false;    //Perform calculations on CPU?
    bool useGPU = true;     //Perform calculations on GPU? (default)

//--------------------------------------------------------------------------------------------------
//This section of code deals with input parameters from the command line

    //Initialize default option values
    unsigned device = 0; //ID of GPU to run on 
    bool discretize_input = true; //Discretize the input files
    bool discrete_output = false; //Discretize the output files
    unsigned num_bins = 15; //Discrete false by default, this is for simplifying testing
    bool time_code = false; //Time the code
    bool verbose_info = false; //Print calculation details
    bool measure_within_set = false; //Include or exclude single family intersections
    
    std::string file_pattern; //Name of files for the input data
    int setA_index; //Index of sets for set family A
	int setB_index; //Index of sets for set family B
    std::vector<std::string> fileName; //Store list of input files

    //Set option values for each parameter entered
    for(unsigned i = 0; i < argc; ++i){
        if(argv[i] == std::string("-c")){
            //Set program to perform on CPU only
            useCPU = true;
            useGPU = false;

        }else if(argv[i] == std::string("-cg")){
            //Set program to perform on GPU then CPU
            useCPU = true;

        }else if(argv[i] == std::string("-d")){
            //Instruct program to discretize input
            discretize_input = true;

        }else if(argv[i] == std::string("-b")){
            //Set how many bins to discretize into
            std::stringstream convert(argv[i + 1]);
            convert >> num_bins;
            i++;

        }else if(argv[i] == std::string("-mt")){
            //Indicate whether the GPU code should check for empty sets or not
            emptySetCheck = true;

        }else if(argv[i] == std::string("-gpu")){
            //Which device to use
            std::stringstream convert(argv[i + 1]);
            convert >> device;
            i++;

        }else if(argv[i] == std::string("-t")){
            time_code = true;

        }else if(argv[i] == std::string("-cores")){
            //How many cores the cpu has
            std::stringstream convert(argv[i + 1]);
                convert >> CORES;
                if(CORES < 1)
                    CORES = 1;
            i++;

        }else if(argv[i] == std::string("-o")){
            //Declare the size of the feature vectors
            std::stringstream convert(argv[i + 1]);
            convert >> VECTOR_SIZE;
            i++;

        }else if(argv[i] == std::string("-md")){
            //Declare the maximum depth of intersections
            std::stringstream convert(argv[i + 1]);
            convert >> maxDepth;
            i++;

        }else if(argv[i] == std::string("-v")){
            verbose_info = true;

        }else if(argv[i] == std::string("-do")){
            discrete_output = true;

        }else if(argv[i] == std::string("-fd")){
            std::stringstream convert(argv[i + 1]);
			convert >> SETS;
			std::stringstream convertA(argv[i + 3]);
			convertA >> setA_index;
			std::stringstream convertB(argv[i + 4]);
			convertB >> setB_index;
            file_pattern = argv[i+2];
            i+=4;

        }else if(argv[i] == std::string("-help")){
            printHelp();
            return(0);
        
        }else if(argv[i] == std::string("-in")){
            measure_within_set = true;
            
        }else if(argv[i] == std::string("-f")){
            //Push all files after -f into fileName vector
            for(unsigned j = i + 1; j<argc; ++j){
                fileName.push_back(argv[j]);
            }
            break;

        }else if(i > 0){
            std::cout << "Unknown parameter " << argv[i] << 
                ", use -help for a list of possible parameters.\n";
        }
    }

    //Check for valid VECTOR_SIZE
    if(VECTOR_SIZE < 1){
        std::cerr << "The number of elements in each feature vector must be > 0. " <<
            "Set this with the -o parameter.\n";
        exit(1);
    }

    if(fileName.size() == 0){
        string fileNumber;
		
		for(unsigned i = 0; i < SETS/2; i++){
			std::string fileString = file_pattern;
            ostringstream convert;
            convert << (setA_index + i);
            fileNumber = convert.str();
            fileName.push_back(fileString.append(fileNumber).append(".txt"));
        }
		
		for(unsigned i = 0; i < SETS/2; i++){
			std::string fileString = file_pattern;
            ostringstream convert;
            convert << (setB_index + i);
            fileNumber = convert.str();
            fileName.push_back(fileString.append(fileNumber).append(".txt"));
        }
    }

    //Number of Fundamental Subsets is equal to the number of input files
    F_SUBSET_COUNT = fileName.size();

    //Throw error if discretize option is chosen, but invalid, or no bin count is supplied
    if(discretize_input == true && num_bins < 1){
            std::cerr << "Use of -d requires -b  > 0\n";
            exit(1);
    }

    //If maxDepth wasn't set (or is invalid) set to F_SUBSET_COUNT (max depth)
    if(maxDepth <= 0 || maxDepth > F_SUBSET_COUNT)
        maxDepth = F_SUBSET_COUNT;

//--------------------------------------------------------------------------------------------------
    CUDA_CHECK_RETURN(cudaSetDevice(device));

    size_t deviceMemory;
    //Get information about the available devices
    int nDevices;
    cudaGetDeviceCount(&nDevices);
    for(int i = 0; i < nDevices; i++) {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        if(verbose_info == true){
            printf("Device Number: %d\n", i);
            printf("Device name: %s\n", prop.name);
            printf("Shared Memory Limit: %d\n", prop.sharedMemPerBlock);
            printf("Potential tile width: %f!\n", min( 512.0,pow((float)2,
                      floor(log2f(prop.sharedMemPerBlock / ((VECTOR_SIZE + 1)*sizeof(float)*2))))));
        }
        //prop.major checks if the device is emulated or not. 
        //If not emulated, a gpu device is available
        if(prop.major != 9999) 
            gpuDevice = true;
        //Set TILE_WIDTH to the max the specified device can handle
        if(device == i){
            TILE_WIDTH = min(512.0,pow((float)2,floor(log2f(prop.sharedMemPerBlock / 
                             ((VECTOR_SIZE + 1) * sizeof(float) * 2)))));
            deviceMemory = prop.totalGlobalMem;
        }
    }
    std::cout << "Using device " << device << std::endl;
    
    //If no GPU is available, use the CPU
    if(gpuDevice==false) 
        useCPU = true;

    //Total number of elements across all Fundamental Subsets, does not include the Count attribute
    unsigned totalSize = 0;

    std::fstream myfile(fileName[0].c_str(), std::ios_base::in);

    if(myfile.fail()){
        cerr << "Error: " << fileName[0].c_str() << " could not be found.\n";
        exit(1);
    }

    float fileElement;
    //Get size of file
    while (myfile >> fileElement) {
        totalSize++;
    }
    //Get total size of all files combined
    totalSize *= F_SUBSET_COUNT;
    myfile.close();

    //Number of Feature Vectors in each Fundamental Subset
    VECTORS_PER_SUBSET = (totalSize / VECTOR_SIZE) / F_SUBSET_COUNT;

    if(verbose_info == true)
        printf("(Vectors per Set %i)  (Total Size %i) (Vector Size %i)  (Set Count %i)\n", 
                   VECTORS_PER_SUBSET, totalSize/F_SUBSET_COUNT, VECTOR_SIZE, F_SUBSET_COUNT);

    //Calculate how many sets can be handles, given the size of each, and desired intersection depth
    deviceMemory = deviceMemory / (VECTORS_PER_SUBSET * (VECTOR_SIZE+1) * sizeof(float));
    unsigned possibleSets = 1;
    while(true){
        unsigned x = 1;
        bitString pascalSum = 1;
        for(unsigned i = 0; i < maxDepth; ++i){
            if(i>possibleSets) break;
            x = x * ((possibleSets + 1 - i) / (i + 1.0));
            pascalSum += x;
        }
        if(pascalSum > deviceMemory)
            break;
        possibleSets++;
    }

    //Lower possible sets to account for other data usage
    possibleSets = possibleSets - (2 - (possibleSets % 2));
    //Max possible sets is 64 (# of bits in an unsigned long long int)
    possibleSets = min(64, possibleSets);

    printf("With depth %i, you can handle %i sets!\n",maxDepth, possibleSets);

    //If user is trying to run too many files, exit program
    if(F_SUBSET_COUNT > possibleSets){
        std::cerr << "Not enough memory for " << F_SUBSET_COUNT <<" sets of " << VECTOR_SIZE << 
            "x" << VECTORS_PER_SUBSET << " elements\n";
        exit(1);
    }

    //Get pascalMax, the highest pascal number of the F_SUBSET_COUNT-th row,
    // pascalMax also stores how many parallel streams are needed
    //Get pascalTotal, a weighted sum of pascal numbers, used to calculate final measure
    //Initialize totalMeasure, which holds the sum of all weighted measures
    float *prefixPascal = new float[maxDepth+1];
    prefixPascal[0] = 0;
    prefixPascal[1] = 1;
    bitString pascalMax = 0;
    float totalMeasure = 0;
    bitString pascalTotal = F_SUBSET_COUNT;
    bitString emptySetSize = 1;

    float x = F_SUBSET_COUNT;
    for(unsigned i = 1; i <= maxDepth; ++i){
        emptySetSize += x;
        if(i < maxDepth){
            prefixPascal[i+1] = x + prefixPascal[i];
        }
        if(x > pascalMax)
            pascalMax = x;
        
        x = x * ((F_SUBSET_COUNT - i)/ (i + 1.0));
        if(i<maxDepth){
            pascalTotal += (1 + i) * (1 + i) * x;
        }
    }

    //Total width of the intersections power set array
    WIDTH = emptySetSize * VECTORS_PER_SUBSET;

    //Declare array to be discretized, of size, filesize
    float *fundamentalSubset = new float[totalSize];
    float *originalValues;
    if(discrete_output == false)
        originalValues = new float[totalSize];

    //Fill in array with values from input file
    for(unsigned i = 0; i < F_SUBSET_COUNT; ++i){
        unsigned z = 0;
        std::fstream inputFile(fileName[i].c_str(), std::ios_base::in);
        if(inputFile.fail()){
            cerr << "Error: File " << fileName[i].c_str() << " could not be found.\n";
            exit(1);
        }

        while (inputFile >> fileElement) {
            fundamentalSubset[(i * VECTORS_PER_SUBSET) + (z / VECTOR_SIZE) + ((z % VECTOR_SIZE) * 
                VECTORS_PER_SUBSET * F_SUBSET_COUNT)] = fileElement;
            //If user wants original values output, store them in a seperate array
            if(discrete_output == false)
                originalValues[(i * VECTORS_PER_SUBSET) + (z / VECTOR_SIZE) + ((z % VECTOR_SIZE) * 
                    VECTORS_PER_SUBSET * F_SUBSET_COUNT)] = fileElement;
            z++;
        }
        z = 0;
    }

    //Call function to discretize, if specified by user
    if(discretize_input == true)
        discretize(fundamentalSubset, totalSize, num_bins);
        
    //Declare array to hold the Set Descriptions of each Fundamental Subset
    bitString interSetSize = WIDTH * (VECTOR_SIZE + 1);
    float *intersections = new float[interSetSize];
    CUDA_CHECK_RETURN(cudaMallocManaged(&intersections, interSetSize * sizeof(float)));
    printf("Malloc Intersection Set: %s \n", cudaGetErrorString(cudaGetLastError()));

    //Jump here after GPU calculation, if performing calculation on both CPU and GPU (for testing)
    rerunOnCPU:

    //Set all values in the Set Description array to the minimum float value
    initNegative(intersections, WIDTH * (VECTOR_SIZE + 1));

    //Create the Set Descriptions and save them into the Set Description array
    createSetDescription(fundamentalSubset, intersections);

    //Run the intersections on the GPUs
    //If no GPUs are found, or the user specifies to not use them, run the intersections on the CPU
    if(useGPU == true){
        gpuIntersections(intersections, prefixPascal, time_code, emptySetSize);
    }

    if(useCPU == true){
        if(useGPU == true){
            //If user instructed to use CPU and GPU, clear results and run CPU code
            useGPU = false;
            goto rerunOnCPU;
        }
        cpuIntersections(intersections, prefixPascal, time_code);
    }

    //Calculates the final measure of the closeness of intersections
    totalMeasure = calculateMeasure(emptySetSize, prefixPascal, intersections, pascalTotal, 
                       verbose_info, measure_within_set);

    //Write output of final intersection to file
    if(discrete_output == true){
        writeToFile_D(intersections, emptySetSize);
    }else{
        writeToFile(intersections, originalValues);
    }
    
    //Print final measure of nearness of sets
    printf("\nDescriptive Set Intersections final Measure: %f\n", totalMeasure);
	
    cudaFree(intersections);
    return 0;
}

/**
 * Check the return value of the CUDA runtime API call and exit
 * the application if the call has failed.
 */
static void CheckCudaErrorAux(const char *file, unsigned line, 
                                  const char *statement, cudaError_t err){
    if (err == cudaSuccess)
        return;
    std::cerr << statement << " returned " << cudaGetErrorString(err) << "(" << err << ") at " 
        << file << ":" << line << std::endl;
    exit (1);
}
