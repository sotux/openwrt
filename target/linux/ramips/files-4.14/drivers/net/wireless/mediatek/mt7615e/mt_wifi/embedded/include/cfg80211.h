#ifdef MTK_LICENSE
/****************************************************************************
 * Ralink Tech Inc.
 * Taiwan, R.O.C.
 *
 * (c) Copyright 2002, Ralink Technology, Inc.
 *
 * All rights reserved. Ralink's source code is an unpublished work and the
 * use of a copyright notice does not imply otherwise. This source code
 * contains confidential trade secret material of Ralink Tech. Any attemp
 * or participation in deciphering, decoding, reverse engineering or in any
 * way altering the source code is stricitly prohibited, unless the prior
 * written consent of Ralink Technology, Inc. is obtained.
 ***************************************************************************/
#endif /* MTK_LICENSE */
/****************************************************************************

	Abstract:

	All MAC80211/CFG80211 Related Structure & Definition.

***************************************************************************/
#ifndef __CFG80211_H__
#define __CFG80211_H__

#ifdef RT_CFG80211_SUPPORT

#include <linux/ieee80211.h>

#ifndef _LINUX_BITOPS_H
#define BIT(n)                          ((UINT32) 1 << (n))
#endif /* BIT */

#define MT76_BAND_2GHZ    0
#define MT76_BAND_5GHZ    1
#define MT76_NUM_BANDS    2

#define IEEE80211_CHAN_DISABLED		  1<<0
#define IEEE80211_CHAN_PASSIVE_SCAN	  1<<1
#define IEEE80211_CHAN_NO_IBSS		  1<<2
#define IEEE80211_CHAN_RADAR		  1<<3
#define IEEE80211_CHAN_NO_HT40PLUS	  1<<4
#define IEEE80211_CHAN_NO_HT40MINUS	  1<<5

#define STATION_INFO_INACTIVE_TIME    1<<0
#define STATION_INFO_RX_BYTES         1<<1
#define STATION_INFO_TX_BYTES         1<<2
#define STATION_INFO_LLID             1<<3
#define STATION_INFO_PLID             1<<4
#define STATION_INFO_PLINK_STATE      1<<5
#define STATION_INFO_SIGNAL           1<<6
#define STATION_INFO_TX_BITRATE       1<<7
#define STATION_INFO_RX_PACKETS       1<<8
#define STATION_INFO_TX_PACKETS       1<<9
#define STATION_INFO_TX_RETRIES       1<<10
#define STATION_INFO_TX_FAILED        1<<11
#define STATION_INFO_RX_DROP_MISC     1<<12
#define STATION_INFO_SIGNAL_AVG       1<<13
#define STATION_INFO_RX_BITRATE       1<<14
#define STATION_INFO_BSS_PARAM        1<<15
#define STATION_INFO_CONNECTED_TIME   1<<16
#define STATION_INFO_ASSOC_REQ_IES    1<<17
#define STATION_INFO_STA_FLAGS        1<<18
#define STATION_INFO_BEACON_LOSS_COUNT 1<<19
#define STATION_INFO_T_OFFSET          1<<20
#define STATION_INFO_LOCAL_PM          1<<21
#define STATION_INFO_PEER_PM           1<<22
#define STATION_INFO_NONPEER_PM        1<<23
#define STATION_INFO_RX_BYTES64        1<<24
#define STATION_INFO_TX_BYTES64        1<<25

#define RATE_INFO_FLAGS_MCS              BIT(0)
#define RATE_INFO_FLAGS_VHT_MCS          BIT(1)
#define RATE_INFO_FLAGS_40_MHZ_WIDTH     BIT(2)
#define RATE_INFO_FLAGS_80_MHZ_WIDTH     BIT(3)
#define RATE_INFO_FLAGS_80P80_MHZ_WIDTH  BIT(4)
#define RATE_INFO_FLAGS_160_MHZ_WIDTH    BIT(5)
#define RATE_INFO_FLAGS_SHORT_GI         BIT(6)
#define RATE_INFO_FLAGS_60G              BIT(7)


typedef enum _NDIS_HOSTAPD_STATUS {
	Hostapd_Diable = 0,
	Hostapd_EXT,
	Hostapd_CFG
} NDIS_HOSTAPD_STATUS, *PNDIS_HOSTAPD_STATUS;


typedef struct __CFG80211_CB {

	/* we can change channel/rate information on the fly so we backup them */
	struct ieee80211_supported_band Cfg80211_bands[MT76_NUM_BANDS];
	struct ieee80211_channel *pCfg80211_Channels;
	struct ieee80211_rate *pCfg80211_Rates;

	/* used in wiphy_unregister */
	struct wireless_dev *pCfg80211_Wdev;

	/* used in scan end */
	struct cfg80211_scan_request *pCfg80211_ScanReq;

	/* monitor filter */
	UINT32 MonFilterFlag;

	/* channel information */
	struct ieee80211_channel ChanInfo[MAX_NUM_OF_CHANNELS];

	/* to protect scan status */
	spinlock_t scan_notify_lock;
		
} CFG80211_CB;

#define WDEV_NOT_FOUND  -1

/*
========================================================================
Routine Description:
	Register MAC80211 Module.

Arguments:
	pAd				- WLAN control block pointer
	pDev			- Generic device interface
	pNetDev			- Network device

Return Value:
	NONE

Note:
	pDev != pNetDev
	#define SET_NETDEV_DEV(net, pdev)	((net)->dev.parent = (pdev))

	Can not use pNetDev to replace pDev; Or kernel panic.
========================================================================
*/
BOOLEAN CFG80211_Register(
	VOID						*pAd,
	struct device				*pDev,
	struct net_device			*pNetDev);

#endif /* RT_CFG80211_SUPPORT */

#endif /* __CFG80211_H__ */

/* End of cfg80211.h */
