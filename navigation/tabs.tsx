import React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import HomeScreen from '../screens/HomeScreen.tsx';
import TodoScreen from '../screens/TodoScreen.tsx';
import MemoScreen from '../screens/MemoScreen.tsx';
import CalendarScreen from '../screens/CalendarScreen.tsx';
import MyScreen from '../screens/MyScreen.tsx';
import HomeIcon from '../components/icons/HomeIcon.tsx';
import TodoIcon from '../components/icons/TodoIcon.tsx';
import MemoIcon from '../components/icons/MemoIcon.tsx';
import MyIcon from '../components/icons/MyIcon.tsx';
import CalendarIcon from '../components/icons/CalendarIcon.tsx';
import {IconLabel, IconView} from '../styles/tabs.styled.ts';

interface IconProps {
  focused: boolean;
  size: number;
  label: string;
}

interface LabelProps {
  focused: boolean;
  label: string;
}

const Tab = createBottomTabNavigator();

const Tabs = () => {
  const renderIcon = ({focused, size, label}: IconProps) => {
    switch (label) {
      case '홈':
        return (
          <IconView>
            <HomeIcon
              size={size}
              color={focused ? '#469ddd' : '#aabdc8'}
            />
          </IconView>
        );
      case '할 일':
        return  (
          <IconView>
            <TodoIcon
              size={size}
              color={focused ? '#469ddd' : '#aabdc8'}
            />
            </IconView>
          );
      case '메모':
        return  (
          <IconView>
            <MemoIcon
              size={size}
              color={focused ? '#469ddd' : '#aabdc8'}
            />
          </IconView>
        );
      case '일정':
        return (
          <IconView>
            <CalendarIcon
              size={size}
              color={focused ? '#469ddd' : '#aabdc8'}
            />
          </IconView>
        );
      case '내 정보':
        return (
          <IconView>
            <MyIcon
              size={size}
              color={focused ? '#469ddd' : '#aabdc8'}
            />
          </IconView>
        );
    }
  };
  const renderLabel = ({focused, label}: LabelProps) => {
    return (
      <IconLabel focused={focused}>
        {label}
      </IconLabel>
    );
  };

  return (
    <Tab.Navigator
      initialRouteName="홈"
      screenOptions={({route}) => ({
        headerShown: false,
        tabBarStyle: {
          position: 'absolute',
          elevation: 0,
          backgroundColor: '#fff',
          borderTopLeftRadius: 32,
          borderTopRightRadius: 32,
          padding: 12,
          height: 100,
        },
        tabBarIcon: ({focused, size}) => renderIcon({focused, size, label: route.name}),
        tabBarLabel: ({focused}) => renderLabel({focused, label: route.name}),
      })}
    >
      <Tab.Screen
        name="메모"
        component={MemoScreen}
      />
      <Tab.Screen
        name="할 일"
        component={TodoScreen}
      />
      <Tab.Screen
        name="홈"
        component={HomeScreen}
      />
      <Tab.Screen
        name="일정"
        component={CalendarScreen}
      />
      <Tab.Screen
        name="내 정보"
        component={MyScreen}
      />
    </Tab.Navigator>
  );
};

export default Tabs;
