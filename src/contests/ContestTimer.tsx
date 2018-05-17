import * as moment from 'moment';
import * as React from 'react';

export interface ContestTimerProps extends React.Props<ContestTimer> {
  startAt: Date;
  endAt: Date;
}

export interface ContestTimerState {
  date: Date;
}

export default class ContestTimer extends React.Component<ContestTimerProps, ContestTimerState> {
  public render(): JSX.Element {
    if (this.props.startAt <= this.state.date && this.state.date <= this.props.endAt) {
      const remainingTime: moment.Moment = moment(this.props.endAt.getTime() - this.state.date.getTime());

      return (
        <div>
          {t('remaining_time')}
          <br />
          {remainingTime.format('HH:mm:ss')}
        </div>
      );
    } else {
      const date: moment.Moment = moment(this.state.date);

      return (
        <div>
          {date.format('Y-MM-DD (ddd)')}
          <br />
          {date.format('HH:mm:ss')}
        </div>
      );
    }
  }
}
