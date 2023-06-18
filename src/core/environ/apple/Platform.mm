#include "Platform.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
//#include <sys/sysinfo.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <sys/resource.h>

const std::vector<std::string> &TVPGetApplicationHomeDirectory()
{
    std::vector<std::string> path;
    return path;
}

void TVPGetMemoryInfo(TVPMemoryInfo &m)
{
//    /* to read /proc/meminfo */
//    FILE* meminfo;
//    char buffer[100] = {0};
//    char* end;
//    int found = 0;
//
//    /* Try to read /proc/meminfo, bail out if fails */
//    meminfo = fopen("/proc/meminfo", "r");
//
//    static const char
//            pszMemFree[] = "MemFree:",
//            pszMemTotal[] = "MemTotal:",
//            pszSwapTotal[] = "SwapTotal:",
//            pszSwapFree[] = "SwapFree:",
//            pszVmallocTotal[] = "VmallocTotal:",
//            pszVmallocUsed[] = "VmallocUsed:";
//
//    /* Read each line untill we got all we ned */
//    while( fgets( buffer, sizeof( buffer ), meminfo ) )
//    {
//        if( strstr( buffer, pszMemFree ) == buffer )
//        {
//            m.MemFree = strtol( buffer + sizeof(pszMemFree), &end, 10 );
//            found++;
//        }
//        else if( strstr( buffer, pszMemTotal ) == buffer )
//        {
//            m.MemTotal = strtol( buffer + sizeof(pszMemTotal), &end, 10 );
//            found++;
//        }
//        else if( strstr( buffer, pszSwapTotal ) == buffer )
//        {
//            m.SwapTotal = strtol( buffer + sizeof(pszSwapTotal), &end, 10 );
//            found++;
//            break;
//        }
//        else if( strstr( buffer, pszSwapFree ) == buffer )
//        {
//            m.SwapFree = strtol( buffer + sizeof(pszSwapFree), &end, 10 );
//            found++;
//            break;
//        }
//        else if( strstr( buffer, pszVmallocTotal ) == buffer )
//        {
//            m.VirtualTotal = strtol( buffer + sizeof(pszVmallocTotal), &end, 10 );
//            found++;
//            break;
//        }
//        else if( strstr( buffer, pszVmallocUsed ) == buffer )
//        {
//            m.VirtualUsed = strtol( buffer + sizeof(pszVmallocUsed), &end, 10 );
//            found++;
//            break;
//        }
//    }
//    fclose(meminfo);
}

#include <sched.h>
void TVPRelinquishCPU(){
    sched_yield();
}

void TVP_utime(const char *name, time_t modtime) {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    timeval mt[2];
    mt[0].tv_sec = modtime;
    mt[0].tv_usec = 0;
    mt[1].tv_sec = modtime;
    mt[1].tv_usec = 0;
    utimes(name, mt);
}

std::string TVPGetPackageVersionString() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return "mac";
}

bool TVP_stat(const char *name, tTVP_stat &s) {
    struct stat t;
    // static_assert(sizeof(t.st_size) == 4, "");
    static_assert(sizeof(t.st_size) == 8, "");
    bool ret = !stat(name, &t);
    s.st_mode = t.st_mode;
    s.st_size = t.st_size;
#undef st_atime
    s.st_atime = t.st_atimespec.tv_sec;
#undef st_mtime
    s.st_mtime = t.st_mtimespec.tv_sec;
#undef st_ctime
    s.st_ctime = t.st_ctimespec.tv_sec;
    return ret;
}

bool TVP_stat(const tjs_char *name, tTVP_stat &s) {
    tTJSNarrowStringHolder holder(name);
    return TVP_stat(holder, s);
}

tjs_int TVPGetSystemFreeMemory()
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return 1000;
}

int TVPShowSimpleMessageBox(const ttstr & text, const ttstr & caption, const std::vector<ttstr> &vecButtons)
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return -1;
}

int TVPShowSimpleInputBox(ttstr &text, const ttstr &caption, const ttstr &prompt, const std::vector<ttstr> &vecButtons)
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return -1;
}

int TVPShowSimpleMessageBox(const char *pszText, const char *pszTitle, unsigned int nButton, const char **btnText) {
    std::vector<ttstr> vecButtons;
    for (unsigned int i = 0; i < nButton; ++i) {
        vecButtons.emplace_back(btnText[i]);
    }
    return TVPShowSimpleMessageBox(pszText, pszTitle, vecButtons);
}

tjs_uint32 TVPGetRoughTickCount32()
{
    tjs_uint32 uptime = 0;
    struct timespec on;
    if (clock_gettime(CLOCK_MONOTONIC, &on) == 0)
        uptime = on.tv_sec * 1000 + on.tv_nsec / 1000000;
    return uptime;
}

void TVPProcessInputEvents() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
}

std::string TVPGetCurrentLanguage() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return "zh_cn";
}

tjs_int TVPGetSelfUsedMemory()
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return 0;
}

std::vector<std::string> TVPGetAppStoragePath() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    std::vector<std::string> ret;
    return ret;
}

bool TVPCheckStartupPath(const std::string &path)
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return true;
}

bool TVPWriteDataToFile(const ttstr &filepath, const void *data, unsigned int size)
{
    FILE *fpOut = fopen(filepath.AsStdString().c_str(), "wb");
    if (!fpOut)
    {
        printf("\"%s\" path is invalid!\n", filepath.AsStdString().c_str());
        return false;
    }
    fwrite(data, size, 1, fpOut);
    fclose(fpOut);
    return true;
}

void TVPForceSwapBuffer() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
}

void TVPExitApplication(int code)
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
}

void TVPControlAdDialog(int adType, int arg1, int arg2)
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
}

bool TVPCheckStartupArg()
{
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return false;
}

void TVPSendToOtherApp(const std::string &filename) {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
}

std::vector<std::string> TVPGetDriverPath() {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    std::vector<std::string> ret;
    return ret;
}

bool strPreCompare(std::string_view src, const char* keyStr)
{
    return keyStr != nullptr && src.compare(0, strlen(keyStr), keyStr) == 0;
}

bool strRemove(std::string& src, std::string_view substr)
{
    auto pos = src.find(substr);
    if (pos != std::string::npos)
    {
        src.erase(pos, substr.length());
        return true;
    }
    return false;
}

bool TVPCreateFolders(const ttstr &folder)
{
    auto folderStr = folder.AsStdString();
    std::string prefix = "file://.";
    if (strPreCompare(folderStr, prefix.c_str()))
    {
        strRemove(folderStr, prefix);
    }
    printf("%s:%d -> %s\n", __FILE_NAME__, __LINE__, folderStr.c_str());
//    return [manager createFileAtPath:[NSString stringWithCString:folder.AsStdString().c_str()] contents:nil attributes:nil];
    std::string command;
//    command = "mkdir -p " + folderStr;
//    system(command.c_str());
    return true;
}

bool TVPRenameFile(const std::string &from, const std::string &to) {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return false;
}

bool TVPDeleteFile(const std::string &filename) {
    printf("%s:%d\n", __FILE_NAME__, __LINE__);
    return false;
}


void TVPGL_ASM_Init()
{

}
